Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 06E1F52A73
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 21:07:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAV002M7HB2YXJ1@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Sep 2012 16:06:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DFE7D201A7; Mon,
	24 Sep 2012 17:06:37 -0400 (EDT)
Date: Mon, 24 Sep 2012 17:06:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120924210637.GE4278@denix.org>
References: <1348274886-27669-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348274886-27669-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extras][PATCH] ussp-push: Add ussp-push
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
X-List-Received-Date: Mon, 24 Sep 2012 21:07:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 21, 2012 at 07:48:06PM -0500, Franklin S. Cooper Jr wrote:
> * Port ussp-push recipes from oe-classic.
> * Adds ussp-push which is a OBEX object pusher for Linux that uses
>   the BlueZ bluetooth stack.

Is this being submitted to oe-core or meta-oe?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ussp-push/ussp-push-0.11/hci_remote_name.patch |   13 ++++++++++++
>  .../ussp-push/ussp-push_0.11.bb                    |   21 ++++++++++++++++++++
>  2 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
>  create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
> new file mode 100644
> index 0000000..956e048
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
> @@ -0,0 +1,13 @@
> +diff -urN ussp-push-0.11/src/obex_socket.c ussp-push-0.11_Demo/src/obex_socket.c
> +--- ussp-push-0.11/src/obex_socket.c	2008-08-25 02:18:53.000000000 +0530
> ++++ ussp-push-0.11_Demo/src/obex_socket.c	2010-04-16 15:11:27.000000000 +0530
> +@@ -197,7 +197,8 @@
> +	for (i = 0; i < niinf; i++) {
> +		char devname[128];
> +
> +-		if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
> ++		if (hci_read_remote_name(dd, &piinf[i].bdaddr,
> ++					sizeof(devname) - 1,
> +				    devname, 100000) >= 0) {
> +			if (strcasecmp(devname, btname) == 0) {
> +				*btaddr = piinf[i].bdaddr;
> diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
> new file mode 100644
> index 0000000..a2ca571
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "OBEX object pusher"
> +HOMEPAGE = "http://www.xmailserver.org/ussp-push.html"
> +SECTION = "console"
> +PRIORITY = "optional"
> +DEPENDS = "bluez4 openobex"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://www.xmailserver.org/ussp-push-${PV}.tar.gz \
> +	       file://hci_remote_name.patch"
> +
> +S = "${WORKDIR}/ussp-push-${PV}"
> +
> +EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "5c44983ee27809867041feff6bb4423a"
> +SRC_URI[sha256sum] = "bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

