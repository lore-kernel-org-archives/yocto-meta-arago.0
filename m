Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5B3B052981
	for <meta-arago@arago-project.org>;
	Thu, 18 Apr 2013 20:27:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3IKRAVq030667
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 15:27:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3IKRAue005628
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2013 15:27:10 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Apr 2013 15:27:10 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3IKRAm8027401;
	Thu, 18 Apr 2013 15:27:10 -0500
Date: Thu, 18 Apr 2013 16:27:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20130418202709.GV1518@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B17C6FFB3@DNCE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B17C6FFB3@DNCE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Thu, 18 Apr 2013 20:27:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eyal,

Thanks for the v2 of the patch.


On Thu, Apr 18, 2013 at 07:10:36AM +0000, Reizer, Eyal wrote:
> Add a recipe for building and installing the wlconf configuration utility
> for TI Wilink8 familily of chips.

If you don't want the patch revision changelog to appear in the commit 
description, please add it after the --- mark.


> Changes in v2:
> * Rename to use an actual release name instead of _git
> * Line indentation fixes
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com<mailto:eyalr@ti.com>>
> ---
>  .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb> |   37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb>
> 
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb>
> new file mode 100644
> index 0000000..ec10d23
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb<http://wlconf_r8.a6.01.bb>
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "Configuration utility for TI wireless drivers"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438<file:///\\README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438>"
> +
> +PR ="r1"
> +PV ="0.0"

Here you overwrite the recipe version (0.0) from the one set by the filename 
(r8.a6.01) - you probably want to drop PV assignment here.

BTW, I already mentioned the dangers of mixing alpha-numeric characters in the 
version number, which can potentially cause the wrong sorting of the versions. 
I guess in this case there's not much we can do, but something to keep in mind 
when coming up with future fersion numbers...


> +PR_append = "+gitr${SRCREV}"
> +
> +SRCREV = "ol_r8.a6.01"
> +SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git<http://github.com/TI-OpenLink/18xx-ti-utils.git>"
> +
> +S = "${WORKDIR}/git/wlconf"
> +
> +EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -d ${D}${bindir}/wlconf/
> +       install -d ${D}${bindir}/wlconf/official_inis
> +
> +       install -m 0755 wlconf ${D}${bindir}/wlconf/
> +       install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> +       install -m 0755 struct.bin ${D}${bindir}/wlconf/
> +       install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> +       install -m 0755 README ${D}${bindir}/wlconf/
> +       install -m 0755 example.conf ${D}${bindir}/wlconf/
> +       install -m 0755 example.ini ${D}${bindir}/wlconf/
> +       install -m 0755 ${S}/official_inis/*
> +                       ${D}${bindir}/wlconf/official_inis/
> +}
> +
> +FILES_${PN} += " \
> +       ${bindir}/wlconf \
> +       ${bindir}/wlconf/official_inis \
> +"
> +
> +FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
> --
> 1.7.9.5
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


