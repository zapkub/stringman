package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.ListenAndServe("0.0.0.0:2901", http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {
		var input1, input2 = r.FormValue("input1"), r.FormValue("input2")
		if len(input1) == 0 || len(input2) == 0 {
			rw.WriteHeader(http.StatusBadRequest)
			rw.Write([]byte(string("input1 and input2 parameter is required")))
			return
		}
		rw.WriteHeader(200)
		rw.Write([]byte(fmt.Sprintf("%s%s", input1, input2)))
	}))

}
