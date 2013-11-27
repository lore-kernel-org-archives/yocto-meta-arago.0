Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C8B8352A87
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2013 14:00:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rARE0tGS005038
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 08:00:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rARE0sis029468
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 08:00:55 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 27 Nov 2013 08:00:54 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] linaro-pm-qa-utils: Remove hardcoded
	relative	paths
Thread-Index: AQHO6vlv1NXGw+EhX0CpcTGPjslfv5o5HCDg
Date: Wed, 27 Nov 2013 14:00:54 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598609AA@DLEE11.ent.ti.com>
References: <1385506012-3309-1-git-send-email-ceh@ti.com>
In-Reply-To: <1385506012-3309-1-git-send-email-ceh@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] linaro-pm-qa-utils: Remove hardcoded relative	paths
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
X-List-Received-Date: Wed, 27 Nov 2013 14:00:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hernandez, Carlos
>Sent: Tuesday, November 26, 2013 4:47 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] linaro-pm-qa-utils: Remove hardcoded
>relative paths
>
>Some scripts contained hardcoded relative paths to not existing
>files. This patch removes the relative paths and instead let BASH
>resolve the path to the executable.

PR bump please

>
>Signed-off-by: Carlos Hernandez <ceh@ti.com>
>---
> .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |    5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-
>qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-
>devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
>index dcf599f..0ba1682 100644
>--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-
>qa-utils_git.bb
>+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-
>qa-utils_git.bb
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

