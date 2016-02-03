Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8F73D5208B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 21:01:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u13L1mMK032611
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 15:01:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13L1mrY013198
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 15:01:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Feb 2016 15:01:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13L1mP7018352;
	Wed, 3 Feb 2016 15:01:48 -0600
Date: Wed, 3 Feb 2016 16:01:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20160203210132.GA31480@edge>
References: <1454532174-3980-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454532174-3980-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] qtmultimedia: add gstreamer in PACKAGECONFIG to enable video
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
X-List-Received-Date: Wed, 03 Feb 2016 21:01:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK, no need for bbappend to adjust PACKAGECONFIG - see arago.conf for other 
examples.

-- 
Denys


On Wed, Feb 03, 2016 at 03:42:54PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend
> new file mode 100644
> index 0000000..f164f6e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend
> @@ -0,0 +1,5 @@
> +PR_append = "-arago0"
> +
> +PACKAGECONFIG ??= "gstreamer \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

