package main

import (
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

var (
	db *gorm.DB
)

func init() {
	/*var err error
	dsn := "postgresql://postgres:postgres@localhost/logistic?sslmode=disable" // Update with your database credentials
	db, err = gorm.Open("postgres", dsn)
	if err != nil {
		panic("failed to connect to database")
	}

	// Auto migrate the User modeliifwvk
	db.AutoMigrate(&User{})*/
}

type User struct {
	gorm.Model
	Name  string `json:"name"`
	Email string `json:"email"`
}

func getUsers(c *gin.Context) {
	var users []User
	db.Find(&users)
	c.JSON(200, users)
}

func helloWorld(c *gin.Context) {
	c.JSON(200, "Jopta")
}

func main() {
	r := gin.Default()

	// Routes
	//r.GET("/users", getUsers)
	r.GET("/", helloWorld)

	// Start server
	r.Run("127.0.0.1:8080")
}
