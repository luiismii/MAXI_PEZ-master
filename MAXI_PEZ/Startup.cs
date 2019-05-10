using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MAXI_PEZ.Startup))]
namespace MAXI_PEZ
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
