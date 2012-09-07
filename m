Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 913AF529A1
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 20:40:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M9Z00JKZYQSJ791@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 07 Sep 2012 15:40:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 75B28201B8; Fri,
	07 Sep 2012 16:40:01 -0400 (EDT)
Date: Fri, 07 Sep 2012 16:40:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120907204001.GB13366@denix.org>
References: <1346288619-21223-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1346288619-21223-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-distro][PATCH] task-arago-tisdk-addons: Port task-arago-tisdk-addons-host from arago to meta-arago
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
X-List-Received-Date: Fri, 07 Sep 2012 20:40:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 29, 2012 at 08:03:38PM -0500, Franklin S Cooper Jr wrote:
> * This is a initial port of task-arago-tisdk-addons-host from arago to meta-arago.
>   In arago, this task was originally called task-arago-toolchain-tisdk-addons-host.

I would agree that task-arago-toolchain-tisdk-addons-host is a very long name, 
but we need to clearly mark the tasks that are used for SDK/toolchain/devkit 
vs. the ones that are used for the filesystem/image.

As an alternative, we can use task-arago-tisdk-sdk-host. I.e. all 3 would look 
like:

task-arago-tisdk-addons
task-arago-tisdk-addons-sdk-host
task-arago-tisdk-addons-sdk-target

The next step would be to start dropping "arago" and "tisdk" parts from the 
name... :)

-- 
Denys


> * Remove references to Matrix applications since the new Matrix task should
>   handle Matrix related applications
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../tasks/task-arago-tisdk-addons-host.bb          |   21 ++++++++++++++++++++
>  .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   17 +++++++++------
>  2 files changed, 31 insertions(+), 7 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb
> new file mode 100644
> index 0000000..3856197
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit task
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +UTILS = " \
> +    am-sysinfo-src \
> +    arm-benchmarks-src \
> +"
> +
> +# Add pru and profibus sources for omapl138 devices
> +UTILS_append_am180x-evm = " \
> +    ti-pru-sw-examples-src \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${UTILS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
> index 789700d..167df12 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
> @@ -1,22 +1,25 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> -PR = "r0"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r1"
>  
>  inherit task
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  UTILS = " \
> -    matrix-gui-settings-demos \
> -    matrix-gui-armbenchmarks-demos \
> +    am-sysinfo \
> +    dt \
>      task-arago-test \
>      gdbserver \
> -    matrix-gui-oprofile-demos \
> -    "
> +    oprofile \
> +    nbench-byte \
> +    trace-cmd \
> +    arm-benchmarks \
> +"
>  
>  # Add PRU examples for am180x-evm devices
> -# UTILS_append_am180x-evm = " ti-pru-sw-examples"
> +UTILS_append_am180x-evm = " ti-pru-sw-examples"
>  
>  RDEPENDS_${PN} = "\
>      ${UTILS} \
> -    "
> +"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

