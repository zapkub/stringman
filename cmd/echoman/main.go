package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {

	wd, _ := os.Getwd()
	fmt.Println(wd)

	fmt.Println("start application!")
	var err = http.ListenAndServe("0.0.0.0:2900", http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {

		b := r.FormValue("input")

		if len(b) == 0 {
			rw.WriteHeader(http.StatusBadRequest)
			rw.Write([]byte(string("input parameter is required")))
			return
		}

		rw.WriteHeader(200)
		rw.Write([]byte(b))

	}))

	if err != nil {
		log.Fatal(err)
	}

}
