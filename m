Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 81E70529BF
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2013 15:32:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rARFWvKA032702
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 09:32:57 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rARFWvVm002706
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 09:32:57 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 27 Nov 2013 09:32:57 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] linaro-pm-qa-utils: Remove hardcoded
	relative paths
Thread-Index: AQHO64C8XKoV3zbrsk+KrGu9YfC2DZo5NNBg
Date: Wed, 27 Nov 2013 15:32:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159860C0E@DLEE11.ent.ti.com>
References: <1385564102-8521-1-git-send-email-ceh@ti.com>
In-Reply-To: <1385564102-8521-1-git-send-email-ceh@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] linaro-pm-qa-utils: Remove hardcoded	relative paths
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
X-List-Received-Date: Wed, 27 Nov 2013 15:32:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hernandez, Carlos
>Sent: Wednesday, November 27, 2013 8:55 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH v2] linaro-pm-qa-utils: Remove
>hardcoded relative paths
>
>Some scripts contained hardcoded relative paths to not existing
>files. This patch removes the relative paths and instead let BASH
>resolve the path to the executable.
>
>Signed-off-by: Carlos Hernandez <ceh@ti.com>
>---
>V2:
>  * PR bump
>---
> .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |    7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-
>qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-
>devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
>index dcf599f..a836a8d 100644
>--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-
>qa-utils_git.bb
>+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-
>qa-utils_git.bb
>@@ -5,7 +5,7 @@ LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>
> PV =3D "0.4.4"
>-PR =3D "r1"
>+PR =3D "r2"
>
> BRANCH ?=3D "master"
> SRCREV =3D "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>@@ -41,6 +41,9 @@ do_install () {
>     # Install the helper scripts in the include directory
>     for script in `find . -name "*.sh" | grep include`
>     do
>+        # Remove hardcoded relative paths
>+        sed -i -e 's#..\/utils\/##' ${script}
>+
>         script_basename=3D`basename ${script}`
>         install -m 0755 $script ${D}${bindir}/linaro-pm-qa-
>include/${script_basename}
>     done
>@@ -53,6 +56,8 @@ do_install () {
>         # directory then change the include path to the absolute
>path
>         # and to reflect the install location of the helper
>scripts.
>         sed -i -e "s#source ../include#source ${bindir}/linaro-
>pm-qa-include#g" ${script}
>+        # Remove hardcoded relative paths
>+        sed -i -e 's#..\/utils\/##' ${script}
>
>         script_basename=3D`basename ${script}`
>         install -m 0755 $script ${D}${bindir}/${script_basename}
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

