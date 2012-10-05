Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id B9316529D6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 16:29:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00FJYHSFVZI0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 11:29:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AA47F2038D; Fri,
	05 Oct 2012 12:29:03 -0400 (EDT)
Date: Fri, 05 Oct 2012 12:29:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005162903.GE23366@denix.org>
References: <1349419480-21560-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349419480-21560-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] task-arago-tisdk-multimedia: Port multimedia task from arago to meta-arago
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
X-List-Received-Date: Fri, 05 Oct 2012 16:29:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 01:44:40AM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
> 
> * Port task-arago-tisdk-multimedia from arago to meta-arago.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use new task naming convention
> 
>  .../tasks/task-arago-tisdk-multimedia-sdk-host.bb  |   21 ++++++++++++++
>  .../task-arago-tisdk-multimedia-sdk-target.bb      |   11 +++++++
>  .../tasks/task-arago-tisdk-multimedia.bb           |   30 ++++++++++++++++++++
>  3 files changed, 62 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
> new file mode 100644
> index 0000000..17defc2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Task to add multimedia related sources into the SDK"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +MULTIMEDIA = ""
> +
> +MULTIMEDIA_append_am37x-evm = " \
> +    av-examples-src \
> +"
> +
> +MULTIMEDIA_append_am3517-evm = " \
> +    av-examples-src \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${MULTIMEDIA} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
> new file mode 100644
> index 0000000..1f17f87
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Task to build and install header and libs into sdk"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

Unlike task-arago-tisdk-multimedia-sdk-host and task-arago-tisdk-multimedia, 
which use machine-specific overrides, this one does not and hence shouldn't 
really be made machine-specific with the PACKAGE_ARCH = MACHINE_ARCH...

-- 
Denys

> +
> +RDEPENDS_${PN} = "\
> +    task-arago-gst-sdk-target \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
> new file mode 100644
> index 0000000..8cd0d2a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "Task to add multimedia related packages"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +MULTIMEDIA = ""
> +
> +MULTIMEDIA_append_omap3 = " \
> +    amsdk-av-files \
> +"
> +
> +MULTIMEDIA_append_ti33x = " \
> +    amsdk-av-files \
> +"
> +
> +MULTIMEDIA_append_am37x-evm = " \
> +    av-examples \
> +"
> +
> +MULTIMEDIA_append_am3517-evm = " \
> +    av-examples \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    task-arago-gst \
> +    ${MULTIMEDIA} \
> +"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

