Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 9FE3F52AB1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 19:38:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH700FTJ57JNAB0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 25 Jan 2013 13:38:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 913F1201A7; Fri,
	25 Jan 2013 14:38:07 -0500 (EST)
Date: Fri, 25 Jan 2013 14:38:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20130125193807.GF23977@denix.org>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
	<1359037281-12610-11-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1359037281-12610-11-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, dgerlach <d-gerlach@ti.com>
Subject: Re: [PATCH 42/47] Makefile_am-benchmarks: Renamed to Makefile_arm-benchmarks
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 19:38:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 24, 2013 at 08:21:16AM -0600, Franklin S. Cooper Jr wrote:
> From: dgerlach <d-gerlach@ti.com>

^^^^^ Can we get the correct From: line here?

And while we are at it, Franklin, do you want to set your own user.email in 
git-config with the TI email, so your From: line matches your Signed-off-by: 
line? Right now it defaults to gmail address, since you send your patches 
through it...

-- 
Denys


> * All references to am-benchmarks changed to arm-benchmarks for Makefile_arm-benchmarks
> 
> ti-tisdk-makefile: Modified to use Makefile_arm-benchmarks rather than Makefile_am-benchmarks
> ---
>  .../ti-tisdk-makefile/Makefile_am-benchmarks       |   24 --------------------
>  .../ti-tisdk-makefile/Makefile_arm-benchmarks      |   24 ++++++++++++++++++++
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++--
>  3 files changed, 27 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
> deleted file mode 100644
> index ba0e0c6..0000000
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -# am-benchmarks build targets
> -am-benchmarks:
> -	@echo =============================
> -	@echo    Building AM Benchmarks
> -	@echo =============================
> -	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make
> -
> -am-benchmarks_clean:
> -	@echo =============================
> -	@echo    Cleaning AM Benchmarks
> -	@echo =============================
> -	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make clean
> -
> -am-benchmarks_install:
> -	@echo ==============================================
> -	@echo   Installing AM Benchmarks - Release version
> -	@echo ==============================================
> -	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install
> -
> -am-benchmarks_install_debug:
> -	@echo ============================================
> -	@echo   Installing AM Benchmarks - Debug Version
> -	@echo ============================================
> -	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> new file mode 100644
> index 0000000..0447ea5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> @@ -0,0 +1,24 @@
> +# arm-benchmarks build targets
> +arm-benchmarks:
> +	@echo =============================
> +	@echo    Building ARM Benchmarks
> +	@echo =============================
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
> +
> +arm-benchmarks_clean:
> +	@echo =============================
> +	@echo    Cleaning ARM Benchmarks
> +	@echo =============================
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make clean
> +
> +arm-benchmarks_install:
> +	@echo ==============================================
> +	@echo   Installing ARM Benchmarks - Release version
> +	@echo ==============================================
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install
> +
> +arm-benchmarks_install_debug:
> +	@echo ============================================
> +	@echo   Installing ARM Benchmarks - Debug Version
> +	@echo ============================================
> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 6208f21..a276140 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -16,7 +16,7 @@ SRC_URI = "\
>      file://Makefile_linux \
>      file://Makefile_u-boot-legacy \
>      file://Makefile_matrix-gui \
> -    file://Makefile_am-benchmarks \
> +    file://Makefile_arm-benchmarks \
>      file://Makefile_am-sysinfo \
>      file://Makefile_av-examples \
>      file://Makefile_u-boot-spl \
> @@ -29,11 +29,11 @@ SRC_URI = "\
>      file://Makefile_wireless \
>  "
>  
> -PR = "r1"
> +PR = "r2"
>  
>  MAKEFILES_COMMON = "linux \
>                      matrix-gui \
> -                    am-benchmarks \
> +                    arm-benchmarks \
>                      am-sysinfo \
>                      matrix-gui-browser \
>                      refresh-screen \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

