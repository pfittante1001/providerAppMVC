using Microsoft.Owin;
using Owin;
using ProviderAppver3;

[assembly: OwinStartupAttribute(typeof(ProviderAppver3.Startup))]
namespace ProviderAppver3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
