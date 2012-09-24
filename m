Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 6383E52A65
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 20:58:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAV00E5AGX2AWR2@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Sep 2012 15:58:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 00D69201A7; Mon,
	24 Sep 2012 16:58:13 -0400 (EDT)
Date: Mon, 24 Sep 2012 16:58:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120924205813.GD4278@denix.org>
References: <1348274841-27630-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348274841-27630-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extras][PATCH] psplash: Add TI color customization
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
X-List-Received-Date: Mon, 24 Sep 2012 20:58:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 21, 2012 at 07:47:21PM -0500, Franklin S. Cooper Jr wrote:
> * Port TI color customization from psplash-ti in oe-classic.

Again, a small discrepancy in the subject, not a big deal. Ack otherwise.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../0001-psplash-Add-Arago-custom-color.patch      |   39 ++++++++++++++++++++
>  .../recipes-core/psplash/psplash_git.bbappend      |    3 +-
>  2 files changed, 41 insertions(+), 1 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> 
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> new file mode 100644
> index 0000000..c13790e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> @@ -0,0 +1,39 @@
> +From be4eb4c5c3992deee2cfaa5da8913473623f728b Mon Sep 17 00:00:00 2001
> +From: Franklin S. Cooper Jr <fcooper@ti.com>
> +Date: Fri, 21 Sep 2012 15:18:24 -0500
> +Subject: [PATCH] psplash: Add Arago custom color
> +
> +* Port custom colors used in psplash-ti from oe-classic.
> +
> +Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> +---
> + psplash-colors.h |    8 ++++----
> + 1 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/psplash-colors.h b/psplash-colors.h
> +index d701089..a6a5992 100644
> +--- a/psplash-colors.h
> ++++ b/psplash-colors.h
> +@@ -20,15 +20,15 @@
> + #define _HAVE_PSPLASH_COLORS_H
> + 
> + /* This is the overall background color */
> +-#define PSPLASH_BACKGROUND_COLOR 0xec,0xec,0xe1
> ++#define PSPLASH_BACKGROUND_COLOR 0x00,0x00,0x00
> + 
> + /* This is the color of any text output */
> +-#define PSPLASH_TEXT_COLOR 0x6d,0x6d,0x70
> ++#define PSPLASH_TEXT_COLOR 0xff,0xff,0xff
> + 
> + /* This is the color of the progress bar indicator */
> +-#define PSPLASH_BAR_COLOR 0x6d,0x6d,0x70
> ++#define PSPLASH_BAR_COLOR 0xe3,0x71,0x00
> + 
> + /* This is the color of the progress bar background */
> +-#define PSPLASH_BAR_BACKGROUND_COLOR 0xec,0xec,0xe1
> ++#define PSPLASH_BAR_BACKGROUND_COLOR 0x00,0x00,0x00
> + 
> + #endif
> +-- 
> +1.7.0.4
> +
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> index b279daa..aaa6167 100644
> --- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> +++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago1"
> +PR_append = "-arago2"
>  
>  # Update which portion of the psplash.h file to use as a checksum. This tweak
>  # has already been done in oe-core master
> @@ -14,6 +14,7 @@ SRC_URI += "file://psplash-18bpp.patch                      \
>              file://0003-Updated-configurability.patch.patch \
>              file://psplash-poky-img.h                       \
>              file://psplash-bar-img.h                        \
> +            file://0001-psplash-Add-Arago-custom-color.patch\
>  "
>  
>  do_configure_prepend() {
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

