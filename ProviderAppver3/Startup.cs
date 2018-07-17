using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProviderAppver3.Startup))]
namespace ProviderAppver3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
