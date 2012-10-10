Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B380152A10
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 20:09:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AK9uB9020452;
	Wed, 10 Oct 2012 15:09:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AK9t78014087;
	Wed, 10 Oct 2012 15:09:55 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:09:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-tisdk-makefile: Port ti-tisdk-makefile
	recipe from Arago
Thread-Index: AQHNpx1JdovD4ni8gkeGyX6eUsu5d5ey+A4w
Date: Wed, 10 Oct 2012 20:09:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592576B4@DLEE12.ent.ti.com>
References: <1349899040-597-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349899040-597-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AHTa AHhV BChD BYlX EAJW E+61 FzkE HatR HcNz I1zf MOZA
	PcYG P5DD TZTH Te2H Ur8+; 2;
	ZgBjAG8AbwBwAGUAcgBqAHIAMgA3AEAAZwBtAGEAaQBsAC4AYwBvAG0AOwBtAGUAdABhAC0AYQByAGEAZwBvAEAAYQByAGEAZwBvAC0AcAByAG8AagBlAGMAdAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {EB836DD6-D11F-472E-A1A2-03709DF297AB};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Wed,
	10 Oct 2012 20:09:52 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQBhAHIAYQBnAG8AXQAgAFsAUABBAFQAQwBIAF0AIAB0AGkALQB0AGkAcwBkAGsALQBtAGEAawBlAGYAaQBsAGUAOgAgAFAAbwByAHQAIAB0AGkALQB0AGkAcwBkAGsALQBtAGEAawBlAGYAaQBsAGUACQByAGUAYwBpAHAAZQAgAGYAcgBvAG0AIABBAHIAYQBnAG8A
x-cr-puzzleid: {EB836DD6-D11F-472E-A1A2-03709DF297AB}
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] ti-tisdk-makefile: Port ti-tisdk-makefile	recipe from Arago
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
X-List-Received-Date: Wed, 10 Oct 2012 20:09:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, October 10, 2012 2:57 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] ti-tisdk-makefile: Port ti-tisdk-
> makefile recipe from Arago
>=20
> * Port recipe that creates the Rules.make and Makefile recipe
> used in the
>   SDK
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile   |    5 +
>  .../ti-tisdk-makefile/Makefile_am-benchmarks       |   24 ++++
>  .../ti-tisdk-makefile/Makefile_am-sysinfo          |   24 ++++
>  .../ti-tisdk-makefile/Makefile_av-examples         |   24 ++++
>  .../ti-tisdk-makefile/Makefile_linux               |   24 ++++
>  .../ti-tisdk-makefile/Makefile_matrix-gui          |   18 +++
>  .../ti-tisdk-makefile/Makefile_matrix-gui-browser  |   24 ++++
>  .../ti-tisdk-makefile/Makefile_pru                 |   18 +++
>  .../ti-tisdk-makefile/Makefile_qml-playground      |   24 ++++
>  .../ti-tisdk-makefile/Makefile_qt-tstat            |   24 ++++
>  .../ti-tisdk-makefile/Makefile_refresh-screen      |   24 ++++
>  .../Makefile_ti-ocf-crypto-module                  |   18 +++
>  .../ti-tisdk-makefile/Makefile_u-boot-legacy       |   16 +++
>  .../ti-tisdk-makefile/Makefile_u-boot-spl          |   17 +++
>  .../ti-tisdk-makefile/Makefile_wireless            |   76
> +++++++++++++
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |   27 +++++
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  112
> ++++++++++++++++++++
>  17 files changed, 499 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_am-benchmarks
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_am-sysinfo
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_av-examples
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_linux
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_matrix-gui
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_pru
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_qml-playground
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_qt-tstat
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_refresh-screen
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_u-boot-spl
>  create mode 100755 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_wireless
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Rules.make
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile_1.0.bb
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile b/meta-arago-distro/recipes-
> tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
> new file mode 100644
> index 0000000..cab8942
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile
> @@ -0,0 +1,5 @@
> +-include Rules.make
> +
> +all: __ALL_TARGETS__
> +clean: __CLEAN_TARGETS__
> +install: __INSTALL_TARGETS__
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_am-benchmarks b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_am-benchmarks
> new file mode 100644
> index 0000000..ba0e0c6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_am-benchmarks
> @@ -0,0 +1,24 @@
> +# am-benchmarks build targets
> +am-benchmarks:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building AM Benchmarks
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-
> benchmarks*"`; make
> +
> +am-benchmarks_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning AM Benchmarks
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-
> benchmarks*"`; make clean
> +
> +am-benchmarks_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo   Installing AM Benchmarks - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-
> benchmarks*"`; make install
> +
> +am-benchmarks_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo   Installing AM Benchmarks - Debug Version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-
> benchmarks*"`; make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_am-sysinfo
> new file mode 100644
> index 0000000..445dd10
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_am-sysinfo
> @@ -0,0 +1,24 @@
> +# am-sysinfo build targets
> +am-sysinfo:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building AM Sysinfo
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`;
> make
> +
> +am-sysinfo_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning AM Sysinfo
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`;
> make clean
> +
> +am-sysinfo_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +	@echo     Installing AM Sysinfo - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`;
> make install
> +
> +am-sysinfo_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Installing AM Sysinfo - Debug version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`;
> make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_av-examples b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_av-examples
> new file mode 100644
> index 0000000..870e8c7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_av-examples
> @@ -0,0 +1,24 @@
> +# av-examples make targets
> +av-examples:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building AV Examples
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*av-
> examples*"`; make
> +
> +av-examples_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning AV Examples
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*av-
> examples*"`; make clean
> +
> +av-examples_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Installing AV Examples - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*av-
> examples*"`; make install
> +
> +av-examples_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Installing AV Examples - Debug version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*av-
> examples*"`; make install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_linux
> new file mode 100644
> index 0000000..457bd24
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_linux
> @@ -0,0 +1,24 @@
> +# Kernel build targets
> +linux:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Building the Linux Kernel
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
> +	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) uImage
> +	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) modules
> +
> +linux_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Installing the Linux Kernel
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	install -d $(DESTDIR)/boot
> +	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/uImage
> $(DESTDIR)/boot
> +	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
> +	install $(LINUXKERNEL_INSTALL_DIR)/System.map
> $(DESTDIR)/boot
> +	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) INSTALL_MOD_PATH=3D$(DESTDIR)
> modules_install
> +
> +linux_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Cleaning the Linux Kernel
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) mrproper
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_matrix-gui b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_matrix-gui
> new file mode 100644
> index 0000000..7b5f30f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_matrix-gui
> @@ -0,0 +1,18 @@
> +# Make Rules for matrix-gui project
> +matrix-gui:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Building Matrix GUI
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
> +
> +matrix-gui_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Cleaning Matrix GUI
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    NOTHING TO DO.
> +
> +matrix-gui_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Installing Matrix GUI
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*matrix-gui-
> 2.0*"`; make install
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser b/meta-
> arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_matrix-gui-browser
> new file mode 100644
> index 0000000..2fc3b21
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_matrix-gui-browser
> @@ -0,0 +1,24 @@
> +# matrix-gui-browser build targets
> +matrix-gui-browser:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building Matrix GUI Browser
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*matrix-gui-
> browser*"`; make -f Makefile.build release
> +
> +matrix-gui-browser_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning Matrix GUI Browser
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*matrix-gui-
> browser*"`; make -f Makefile.build clean
> +
> +matrix-gui-browser_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@echo   Installing Matrix GUI Browser - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*matrix-gui-
> browser*"`; make -f Makefile.build install
> +
> +matrix-gui-browser_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@echo   Installing Matrix GUI Browser - Debug Version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*matrix-gui-
> browser*"`; make -f Makefile.build install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_pru b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_pru
> new file mode 100644
> index 0000000..cfbc4ae
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_pru
> @@ -0,0 +1,18 @@
> +# pru build targets
> +pru: linux
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@echo    Building PRU Examples
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*pru*"`; make
> +
> +pru_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning PRU Examples
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*pru*"`; make
> clean
> +
> +pru_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo     Installing PRU Examples
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*pru*"`; make
> install
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_qml-playground b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_qml-playground
> new file mode 100644
> index 0000000..4d8709a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_qml-playground
> @@ -0,0 +1,24 @@
> +# QML Playground build targets
> +qml-playground:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building QML Playground App
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qml-
> playground*"`; make -f Makefile.build release
> +
> +qml-playground_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning QML Playground App
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qml-
> playground*"`; make -f Makefile.build clean
> +
> +qml-playground_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@echo   Installing QML Playground App - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qml-
> playground*"`; make -f Makefile.build install
> +
> +qml-playground_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +	@echo   Installing QML Playground App - Debug version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qml-
> playground*"`; make -f Makefile.build install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_qt-tstat b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_qt-tstat
> new file mode 100644
> index 0000000..857e058
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_qt-tstat
> @@ -0,0 +1,24 @@
> +# QT Thermostat build targets
> +qt-tstat:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building QT Thermostat App
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qt-tstat*"`;
> make -f Makefile.build release
> +
> +qt-tstat_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning QT Thermostat App
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qt-tstat*"`;
> make -f Makefile.build clean
> +
> +qt-tstat_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@echo   Installing QT Thermostat App - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qt-tstat*"`;
> make -f Makefile.build install
> +
> +qt-tstat_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@echo   Installing QT Thermostat App - Debug version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*qt-tstat*"`;
> make -f Makefile.build install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_refresh-screen b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_refresh-screen
> new file mode 100644
> index 0000000..bcc17fa
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_refresh-screen
> @@ -0,0 +1,24 @@
> +# refresh-screen build targets
> +refresh-screen:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building Refresh Screen
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*refresh-
> screen*"`; make -f Makefile.build release
> +
> +refresh-screen_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning Refresh Screen
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*refresh-
> screen*"`; make -f Makefile.build clean
> +
> +refresh-screen_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +	@echo   Installing Refresh Screen - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +	@cd example-applications; cd `find . -name "*refresh-
> screen*"`; make -f Makefile.build install
> +
> +refresh-screen_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo   Installing Refresh Screen - Debug Version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*refresh-
> screen*"`; make -f Makefile.build install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module b/meta-
> arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_ti-ocf-crypto-module
> new file mode 100644
> index 0000000..19eb61f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_ti-ocf-crypto-module
> @@ -0,0 +1,18 @@
> +# ti-ocf-crypto-module components
> +ti-ocf-crypto-module: linux
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building TI OCF Crypto Module
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-
> crypto-module*"`; make
> +
> +ti-ocf-crypto-module_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Cleaning TI OCF Crypto Module
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-
> crypto-module*"`; make clean
> +
> +ti-ocf-crypto-module_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Installing TI OCF Crypto Module
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-
> crypto-module*"`; make install
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_u-boot-legacy b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_u-boot-legacy
> new file mode 100644
> index 0000000..70640e2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_u-boot-legacy
> @@ -0,0 +1,16 @@
> +# u-boot build targets
> +u-boot-legacy: u-boot
> +u-boot-legacy_clean: u-boot_clean
> +u-boot-legacy_install: u-boot_install
> +
> +u-boot:
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE)
> +
> +u-boot_clean:
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) clean
> +
> +u-boot_install:
> +	install -d $(DESTDIR)/boot
> +	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.bin
> $(DESTDIR)/boot
> +	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map
> $(DESTDIR)/boot
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_u-boot-spl b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_u-boot-spl
> new file mode 100644
> index 0000000..566647c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_u-boot-spl
> @@ -0,0 +1,17 @@
> +# u-boot build targets
> +u-boot-spl: u-boot
> +u-boot-spl_clean: u-boot_clean
> +u-boot-spl_install: u-boot_install
> +
> +u-boot:
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE)
> +
> +u-boot_clean:
> +	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) clean
> +
> +u-boot_install:
> +	install -d $(DESTDIR)/boot
> +	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.img
> $(DESTDIR)/boot
> +	install $(TI_SDK_PATH)/board-support/u-boot-*/MLO
> $(DESTDIR)/boot
> +	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map
> $(DESTDIR)/boot
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_wireless
> new file mode 100755
> index 0000000..708c0ad
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_wireless
> @@ -0,0 +1,76 @@
> +# Wireless build targets
> +wireless: compat-modules bt-firmware bt-enable
> +wireless_install: compat-modules_install bt-firmware_install bt-
> enable_install
> +wireless_clean: compat-modules_clean bt-firmware_clean bt-
> enable_clean
> +
> +bt-firmware:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Building bt-firmware
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
> +
> +bt-firmware_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Installing bt-firmware
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*bt-
> firmware*"`; make DEST_DIR=3D${DESTDIR} BASE_LIB_DIR=3D"/lib"
> PLATFORM=3D${PLATFORM} install
> +
> +bt-firmware_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Cleaning bt-firmware
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@echo    NOTHING TO DO.
> +
> +bt-enable: linux
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@echo      Building bt-enable
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*bt-
> enable*"`; \
> +	make DEST_DIR=3D${DESTDIR} PLATFORM=3D${PLATFORM}
> +
> +bt-enable_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Installing bt-enable
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*bt-
> enable*"`; \
> +	make DEST_DIR=3D${DESTDIR} PLATFORM=3D${PLATFORM} install
> +
> +bt-enable_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@echo      Cleaning bt-enable
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; cd `find . -name "*bt-
> enable*"`; \
> +	make DEST_DIR=3D${DESTDIR} PLATFORM=3D${PLATFORM} clean
> +
> +compat-modules: linux
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Building compat-modules
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
> +	./scripts/driver-select bt; make DEPMOD=3Decho
> DESTDIR=3D${DESTDIR} KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR}
> KLIB=3D${DESTDIR} CROSS_COMPILE=3D${CROSS_COMPILE} ARCH=3Darm; \
> +	cd ..; \
> +	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
> +	./scripts/driver-select wl12xx; make DEPMOD=3Decho
> DESTDIR=3D${DESTDIR} KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR}
> KLIB=3D${DESTDIR} CROSS_COMPILE=3D${CROSS_COMPILE} ARCH=3Darm
> +
> +compat-modules_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Installing compat-modules
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
> +	make DEPMOD=3Decho DESTDIR=3D${DESTDIR}
> KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR} KLIB=3D${DESTDIR}
> INSTALL_MOD_PATH=3D${DESTDIR} CROSS_COMPILE=3D${CROSS_COMPILE}
> ARCH=3Darm install-modules; \
> +	cd ..; \
> +	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
> +	make DEPMOD=3Decho DESTDIR=3D${DESTDIR}
> KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR} KLIB=3D${DESTDIR}
> INSTALL_MOD_PATH=3D${DESTDIR} CROSS_COMPILE=3D${CROSS_COMPILE}
> ARCH=3Darm install-modules
> +
> +compat-modules_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo      Cleaning compat-wireless
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd board-support/extra-drivers; \
> +	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
> +	make DEPMOD=3Decho DESTDIR=3D${DESTDIR}
> KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR} KLIB=3D${DESTDIR}
> CROSS_COMPILE=3D${CROSS_COMPILE} ARCH=3Darm clean; \
> +	cd ..; \
> +	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
> +	make DEPMOD=3Decho DESTDIR=3D${DESTDIR}
> KLIB_BUILD=3D${LINUXKERNEL_INSTALL_DIR} KLIB=3D${DESTDIR}
> CROSS_COMPILE=3D${CROSS_COMPILE} ARCH=3Darm clean
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile/Rules.make b/meta-arago-
> distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Rules.make
> new file mode 100644
> index 0000000..1b0a347
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Rules.make
> @@ -0,0 +1,27 @@
> +#platform
> +PLATFORM=3D__PLATFORM__
> +
> +#Architecture
> +ARCH=3D__ARCH__
> +
> +#u-boot machine
> +UBOOT_MACHINE=3D__UBOOT_MACHINE__
> +
> +#Points to the root of the TI SDK
> +export TI_SDK_PATH=3D__SDK__INSTALL_DIR__
> +
> +#root of the target file system for installing applications
> +DESTDIR=3D__DESTDIR__
> +
> +#Points to the root of the Linux libraries and headers matching
> the
> +#demo file system.
> +export LINUX_DEVKIT_PATH=3D$(TI_SDK_PATH)/linux-devkit
> +
> +#Cross compiler prefix
> +export CROSS_COMPILE=3D$(LINUX_DEVKIT_PATH)/bin/arm-arago-linux-
> gnueabi-
> +
> +#Location of environment-setup file
> +export ENV_SETUP=3D$(LINUX_DEVKIT_PATH)/environment-setup
> +
> +#The directory that points to the SDK kernel source tree
> +LINUXKERNEL_INSTALL_DIR=3D$(TI_SDK_PATH)/board-
> support/__KERNEL_NAME__
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-
> makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-
> tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> new file mode 100644
> index 0000000..2dece10
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> @@ -0,0 +1,112 @@
> +DESCRIPTION =3D "Package containing Makefile and Rules.make file
> for TISDKs"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +
> +# Build the list of component makefiles to put together to build
> the
> +# Makefile that goes into the SDK.  For legacy devices the base
> Makefile
> +# will be picked up and will contain everything.
> +#
> +# It is assumed that the component makefiles follow the naming
> +# Makefile_$component.  All Makefiles will be part of the
> SRC_URI to be
> +# fetched, but only the listed ones will be used to build the
> final Makefile
> +
> +SRC_URI =3D "\
> +    file://Makefile \
> +    file://Rules.make \
> +    file://Makefile_linux \
> +    file://Makefile_u-boot-legacy \
> +    file://Makefile_matrix-gui \
> +    file://Makefile_am-benchmarks \
> +    file://Makefile_am-sysinfo \
> +    file://Makefile_av-examples \
> +    file://Makefile_u-boot-spl \
> +    file://Makefile_matrix-gui-browser \
> +    file://Makefile_refresh-screen \
> +    file://Makefile_pru \
> +    file://Makefile_ti-ocf-crypto-module \
> +    file://Makefile_qt-tstat \
> +    file://Makefile_qml-playground \
> +    file://Makefile_wireless \
> +"
> +
> +PR =3D "r0"
> +
> +MAKEFILES_COMMON =3D "linux \
> +                    matrix-gui \
> +                    am-benchmarks \
> +                    am-sysinfo \
> +                    matrix-gui-browser \
> +                    refresh-screen \
> +                    qt-tstat \
> +"
> +
> +# Add device specific make targets
> +MAKEFILES_omap3 +=3D "u-boot-spl \
> +                    qml-playground \
> +"
> +MAKEFILES_am37x-evm +=3D "av-examples \
> +                        ti-ocf-crypto-module \
> +                        wireless \
> +"
> +MAKEFILES_am3517-evm +=3D "av-examples \
> +                         ti-ocf-crypto-module \
> +"
> +MAKEFILES_ti33x +=3D "u-boot-spl \
> +                    qml-playground wireless \
> +"
> +MAKEFILES_am180x-evm +=3D "pru \
> +                         u-boot-legacy \
> +                         wireless \
> +"
> +
> +# This step will stitch together the final Makefile based on the
> supported
> +# make targets.
> +do_install () {
> +    install -d ${D}/
> +
> +    # Start with the base Makefile
> +    install  ${WORKDIR}/Makefile ${D}/Makefile
> +
> +    # Remember the targets added so we can update the all target
> +    targets=3D""
> +    clean_targets=3D""
> +    install_targets=3D""
> +
> +    # Now add common build targets
> +    for x in ${MAKEFILES_COMMON}
> +    do
> +        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
> +        targets=3D"$targets""$x\ "
> +        clean_targets=3D"$clean_targets""$x""_clean\ "
> +        install_targets=3D"$install_targets""$x""_install\ "
> +    done
> +
> +    # Now add device specific build targets
> +    for x in ${MAKEFILES}
> +    do
> +        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
> +        targets=3D"$targets""$x\ "
> +        clean_targets=3D"$clean_targets""$x""_clean\ "
> +        install_targets=3D"$install_targets""$x""_install\ "
> +    done
> +
> +    # Update the all, clean, and install targets if we added
> targets
> +    if [ "$targets" !=3D "" ]
> +    then
> +        sed -i -e "s/__ALL_TARGETS__/$targets/" ${D}/Makefile
> +        sed -i -e "s/__CLEAN_TARGETS__/$clean_targets/"
> ${D}/Makefile
> +        sed -i -e "s/__INSTALL_TARGETS__/$install_targets/"
> ${D}/Makefile
> +    fi
> +
> +    install  ${WORKDIR}/Rules.make ${D}/Rules.make
> +
> +    # fixup Rules.make values
> +    sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
> +    sed -i -e "s/__ARCH__/${BASE_PACKAGE_ARCH}/" ${D}/Rules.make
> +    sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/"
> ${D}/Rules.make
> +
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +FILES_${PN} =3D "/*"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

