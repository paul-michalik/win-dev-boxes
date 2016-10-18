#define BOOST_TEST_MODULE [module-name]_tests
#include <boost/test/unit_test.hpp>
#include "[module-name]/[module-name].h"

namespace tests {
    class [module-name]_fixture
    {
    public:
        [module-name]_fixture()
        {
            // add test case initilization code 
        }

        ~[module-name]_fixture()
        {
            // add test case de-initilization code 
        }
    };

    BOOST_FIXTURE_TEST_SUITE([module-name]_tests, [module-name]_fixture);

    BOOST_AUTO_TEST_CASE(first_test_case)
    {
    }

    BOOST_AUTO_TEST_SUITE_END();
}