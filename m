Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 36C80529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:54:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJsMRb000673
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:54:22 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJsKBf004549
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:54:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 14:54:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJsJ7E016700;
	Thu, 12 Mar 2015 14:54:20 -0500
Date: Thu, 12 Mar 2015 15:54:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150312195415.GP24885@edge>
References: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 0/4] Implment the wayland DISTRO_FEATURE.
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
X-List-Received-Date: Thu, 12 Mar 2015 19:54:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good, thanks.

On Thu, Mar 12, 2015 at 03:46:18PM -0400, Jacob Stiffler wrote:
> * Only include wayland, weston, and example packages if 'wayland' is a
>   DISTRO_FEATURE.
> * By default, if 'screen' is a MACHINE_FEATURE, then add 'wayland' as a
>   DISTRO_FEATURE.
> * Configure qt5 to use wayland if it is a DISTRO_FEATURE, otherwise use eglfs.
> * Add processor-sdk brand to remove wayland from DISTRO_EFATURES for the ti33x
>   and ti43x soc families.
> 
> 
> Jacob Stiffler (4):
>   arago.conf: Include wayland in DISTRO_FEATURES by default.
>   packagegroup-*: Include wayland/weston if specified in
>     DISTRO_FEATURES.
>   qtbase: Use DISTRO_FEATURES to set appropriate qpa.
>   branding-processor-sdk: Add processor-sdk brand.
> 
>  meta-arago-distro/conf/distro/arago.conf           |    2 +-
>  .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
>  .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
>  .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
>  .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
>  meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    4 +--
>  8 files changed, 47 insertions(+), 12 deletions(-)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> 
> -- 
> v2: Change order of patches.
> 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

