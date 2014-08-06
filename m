Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4F64A529DD
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:04:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76N4EmM030025
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:04:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76N4EV5024776
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:04:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 18:04:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76N4Efl018458;
	Wed, 6 Aug 2014 18:04:14 -0500
Date: Wed, 6 Aug 2014 19:04:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140806230413.GK23523@edge>
References: <1407361067-25558-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407361067-25558-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] qtbase: Build example applications
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
X-List-Received-Date: Wed, 06 Aug 2014 23:04:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Instead of selecting specific package configurations inside the recipe itself 
(or the corresponding bbappend), it's better to control it from a distro 
configuration. You can add it to PACKAGECONFIG_DISTRO_pn-qtbase in arago.conf:

http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/conf/distro/arago.conf;hb=HEAD#l28

-- 
Denys


On Wed, Aug 06, 2014 at 04:37:45PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> new file mode 100644
> index 0000000..b3c05b2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = "-arago0"
> +
> +PACKAGECONFIG += "examples"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

