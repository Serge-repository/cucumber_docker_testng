import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        tags = "@Smoke",           //указав тег, можем тут же запускать через RunnerTest

        // Uncomment for local run
//        features = "src/test/resources/features", // Можно указать несколько папок, например: features = {«src/test/features», «src/test/feat»}
        // Uncomment for selenium grid run
        features = "classpath:features",

        glue = "cucumber_step_defs",  // Можно указать несколько пакетов, например, так: glue = {«ru.savkk.test», «ru.savkk.hooks»}
        plugin = {"pretty", "html:target/cucumber-reports/html_reports",
                "json:target/cucumber-reports/CucumberTestReport.json"
        }
)

public class RunnerTest {    //обязательно название класа заканчивается на Test

}