using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppFullDent.Startup))]
namespace AppFullDent
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
