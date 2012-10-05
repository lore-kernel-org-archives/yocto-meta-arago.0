Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 83E7D529D6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 16:25:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00LY8HM5ZG20@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 11:25:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 432892038D; Fri,
	05 Oct 2012 12:25:17 -0400 (EDT)
Date: Fri, 05 Oct 2012 12:25:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005162517.GD23366@denix.org>
References: <1349419415-21517-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349419415-21517-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] task-arago-gst-sdk-target: Add task to install gstreamer related dev packages
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
X-List-Received-Date: Fri, 05 Oct 2012 16:25:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 01:43:35AM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
> 
> * This task is used to install gstreamer and gstreamer plugins dev packages
> * Remove COMPATIBLE_MACHINE restriction
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use new task naming convention
> 
>  .../tasks/task-arago-gst-sdk-target.bb             |   14 ++++++++++++++
>  .../recipes-core/tasks/task-arago-gst.bb           |    3 +--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> new file mode 100644
> index 0000000..655cd20
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Task to build and install header and libs in sdk"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

I don't see a need for this task to be machine-specific - there are no 
machine-overrides or anything like that... Any specific reason for the above?

> +RDEPENDS_${PN} = "\
> +    gstreamer-dev \
> +    gst-plugins-base-dev \
> +    gst-plugins-good-dev \
> +    gst-plugins-bad-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> index d34402a..da9e41c 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
> @@ -1,8 +1,7 @@
>  DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit task
>  PACKAGE_ARCH = "${MACHINE_ARCH}"

And same here.

-- 
Denys

