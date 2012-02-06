Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 6443D52079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 05:11:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY00AFHH2N0TU4@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 05 Feb 2012 23:11:11 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 50C7D203C6; Mon,
	06 Feb 2012 00:11:11 -0500 (EST)
Date: Mon, 06 Feb 2012 00:11:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120206051111.GC8770@denix.org>
References: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
	<1328216492-7294-5-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328216492-7294-5-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 5/5] task-arago-tisdk-addons: ported from old arago
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
X-List-Received-Date: Mon, 06 Feb 2012 05:11:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 02, 2012 at 03:01:32PM -0600, Chase Maupin wrote:
> * Ported from old arago overlay and added licensing checksum
> * Removed unsupported devices
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-tisdk/tasks/task-arago-tisdk-addons.bb |   22 ++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
> new file mode 100644
> index 0000000..8b1231c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> +PR = "r0"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +UTILS = " \
> +    matrix-gui-settings-demos \
> +    matrix-gui-armbenchmarks-demos \
> +    task-arago-test \
> +    gdbserver \
> +    matrix-gui-oprofile-demos \
> +    "
> +
> +# Add PRU examples for am180x-evm devices
> +UTILS_append_am180x-evm = " ti-pru-sw-examples"

While matrix pieces are now being updated and moved to meta-arago, I don't 
think ti-pru-sw* pieces have made it to either meta-arago or meta-ti...

Would you like to port ti-pru-sw* first, or just comment it out from this task 
for now?

-- 
Denys


> +RDEPENDS_${PN} = "\
> +    ${UTILS} \
> +    "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

