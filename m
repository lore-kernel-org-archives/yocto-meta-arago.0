Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A6B455208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 02:46:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s242kToY011446
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 20:46:29 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s242kTUx030891
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 20:46:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 20:46:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s242kTDS023150;
	Mon, 3 Mar 2014 20:46:29 -0600
Date: Mon, 3 Mar 2014 21:46:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140304024628.GX22125@edge>
References: <1393879945-11703-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393879945-11703-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] initscripts: Add mkdir debugfs and mount
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
X-List-Received-Date: Tue, 04 Mar 2014 02:46:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 03, 2014 at 03:52:25PM -0500, Sam Nelson wrote:
> - Add script to create /debug directory and mount debugfs
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-core/initscripts/files/debugfs.sh      |    8 ++++++++
>  .../initscripts/initscripts_1.0.bbappend           |    8 ++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100755 meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
>  create mode 100644 meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
> new file mode 100755
> index 0000000..17e2474
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/initscripts/files/debugfs.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +if ! [ -e /debug ] ; then
> +  mkdir -p /debug
> +fi
> +mount -t debugfs debugfs /debug

Why /debug? The convention is to use /sys/kernel/debug as a mount point for 
debugfs...


> +
> +exit 0
> diff --git a/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
> new file mode 100644
> index 0000000..1d78ab3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
> @@ -0,0 +1,8 @@
> +FILESEXTRAPATHS_append := "${THISDIR}/files"
> +
> +SRC_URI += "file://debugfs.sh"
> +
> +do_install_append () {
> +	install -c -m 755 ${WORKDIR}/debugfs.sh ${D}${sysconfdir}/init.d/debugfs.sh
> +	update-rc.d -r ${D} devpts.sh start 09 S .

^^^^ copy/paste error - it still says devpts.sh here instead of debugfs.sh :)


Anyway, can you just add it to /etc/fstab? And if you use the default 
/sys/kernel/debug mount point, you won't need to pre-create it. But you 
may need to make sure /sys is mounted... Anyway, take a look at our 
base-files.bbappend in meta-arago-distro. Thanks.

-- 
Denys

