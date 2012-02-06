Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 69B1F52079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 04:29:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY00700F5DQ9B0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 05 Feb 2012 22:29:38 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9520A203C6; Sun,
	05 Feb 2012 23:29:37 -0500 (EST)
Date: Sun, 05 Feb 2012 23:29:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120206042937.GD11841@denix.org>
References: <1328223516-14451-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328223516-14451-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui: remove use of config files
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
X-List-Received-Date: Mon, 06 Feb 2012 04:29:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 02, 2012 at 04:58:36PM -0600, Chase Maupin wrote:
> * Latest sources do not require config files anymore and they
>   have been removed from the repository.  This change was added
>   to the old arago overlay and is ported here.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

Can go in after the initial updated matrix patches are pushed.

-- 
Denys

> ---
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 9d9fce8..63e647f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r7"
> +PR = "r8"
>  
>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> @@ -26,12 +26,6 @@ require matrix-gui-paths.inc
>  
>  S = "${WORKDIR}/git"
>  
> -MATRIX_CONFIG = "800x480_config.ini"
> -MATRIX_CONFIG_am3517-evm = "480x272_config.ini"
> -MATRIX_CONFIG_am180x-evm = "480x272_config.ini"
> -MATRIX_CONFIG_am37x-evm = "640x480_config.ini"
> -MATRIX_CONFIG_beagleboard = "640x480_config.ini"
> -
>  MATRIX_ROT = ""
>  MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
>  
> @@ -51,9 +45,6 @@ do_install(){
>      # TODO: replace init script with systemd files
>      install -d ${D}${sysconfdir}/init.d
>      install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
> -
> -    # Install the matrix config file to configure the screen resolution
> -    install -m 0644 ${S}/matrix_config/${MATRIX_CONFIG} ${D}${MATRIX_WEB_DIR}/matrix_config.ini
>  }
>  
>  RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli matrix-gui-browser refresh-screen"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

