package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"time"
)

type IPAPIResponse struct {
	IP          string `json:"query"`
	City        string `json:"city"`
	Country     string `json:"country"`
	CountryCode string `json:"countryCode"`
	ISP         string `json:"isp"`
}

const (
	url = "http://ip-api.com/json/"
)

func main() {
	apiClient := http.Client{
		Timeout: time.Second * 2, // Maximum of 2 secs
	}

	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Could not create request!")
	}

	res, err := apiClient.Do(req)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Could not get IP-API response! :(")
		return
	}

	data, err := ioutil.ReadAll(res.Body)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Could not read json response!")
		return
	}

	ipResponse := &IPAPIResponse{}
	err = json.Unmarshal([]byte(data), ipResponse)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Could not parse json! :(")
		return
	}

	res.Body.Close()

	if len(os.Args) != 2 {
		fmt.Fprintln(os.Stdout, "Usage: ipinfo <cmd>")
		os.Exit(1)
	}

	switch os.Args[1] {
	case "ip":
		fmt.Fprintln(os.Stdout, ipResponse.IP)
	case "city":
		fmt.Fprintln(os.Stdout, ipResponse.City)
	case "country":
		fmt.Fprintln(os.Stdout, ipResponse.Country)
	case "countryCode":
		fmt.Fprintln(os.Stdout, ipResponse.CountryCode)
	case "isp":
		fmt.Fprintln(os.Stdout, ipResponse.ISP)
	default:
		fmt.Fprintln(os.Stdout, "Enter existing ipinfo command")
	}

	return
}
