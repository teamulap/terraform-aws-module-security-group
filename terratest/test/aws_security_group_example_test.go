
// NOTE:
// run ```dep ensure``` first before running ```go test -v -timeout 90m .```
// go test -v -timeout 90m .

package test
import "fmt"
import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/ using Terratest.
func TestAwsSecurityGroupExample(t *testing.T) {
	t.Parallel()
	sgModuleOptions := &terraform.Options{
		TerraformDir: "../examples/aws-security-group-example",
		NoColor: false,
	}
	terraform.InitAndApply(t, sgModuleOptions)

	// Run `terraform output` to get the values of output variables
	expectedSgLenTest := terraform.OutputRequired(t, sgModuleOptions, "t_security_group_id")
	fmt.Println(expectedSgLenTest)

	// Verify that all output are not empty
	assert.NotEmpty(t, expectedSgLenTest)
	defer terraform.Destroy(t, sgModuleOptions)
}