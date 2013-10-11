Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EA39E5299B
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2013 15:42:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BFgKx8022153
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:42:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFgKw2027562
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:42:20 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 11 Oct 2013 10:42:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 3/4] tisdk-install: Set MAKE_JOBS
	variable	during SDK installation
Thread-Index: AQHOxpaEZICnl6DvekCvPvN5wrsTk5nvo7ww
Date: Fri, 11 Oct 2013 15:42:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597A0AD3@DLEE11.ent.ti.com>
References: <1381508186-30546-1-git-send-email-fcooper@ti.com>
	<1381508186-30546-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1381508186-30546-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 3/4] tisdk-install: Set MAKE_JOBS variable	during SDK installation
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
X-List-Received-Date: Fri, 11 Oct 2013 15:42:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-By: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Friday, October 11, 2013 11:16 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCHv2 3/4] tisdk-install: Set MAKE_JOBS
>variable during SDK installation
>
>* At runtime determine the host's processor count and set
>MAKE_JOBS based on
>  that value.
>* This will allow building software within the SDK as fast as
>possible.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Instead of doing a variable replacement to set MAKE_JOBS append
>the MAKE_JOBS
>string with the optimal value.
>
> .../tisdk-install/tisdk-install/sdk-install.sh     |    8
>++++++++
> .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
> 2 files changed, 9 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-
>install/tisdk-install/sdk-install.sh
>index b19b65f..39fbe82 100644
>--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install/sdk-install.sh
>+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install/sdk-install.sh
>@@ -63,6 +63,14 @@ sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D
>$install_dir/Rules.make
> linux=3D`find $install_dir/board-support -maxdepth 1 -name
>"linux*"`
> linux=3D`basename $linux`
> sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make
>+
>+threads=3D`cat /proc/cpuinfo | grep -c processor`
>+
>+# Create a newline
>+echo >> $install_dir/Rules.make
>+# Set optimal value for the make file's -j option
>+echo "MAKE_JOBS=3D$threads" >> $install_dir/Rules.make
>+
> cd -
>
>
>diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-
>install/tisdk-install_1.0.bb
>index 26a6966..886a6a6 100644
>--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-
>install_1.0.bb
>@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://../sdk-
>install.sh;beginline=3D3;endline=3D19;md5=3D4b899037
>
> SRC_URI =3D "file://sdk-install.sh"
>
>-PR =3D "r0"
>+PR =3D "r1"
>
> do_install () {
>     install -d ${D}/
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

