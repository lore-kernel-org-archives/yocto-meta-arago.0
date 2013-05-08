Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6E464529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 01:12:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r481CoCM022782
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 20:12:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r481CoTo022283
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 20:12:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 20:12:50 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r481CoIM002159;
	Tue, 7 May 2013 20:12:50 -0500
Date: Tue, 7 May 2013 21:12:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sajesh Kumar Saran <sajesh@ti.com>
Message-ID: <20130508011249.GO12982@edge>
References: <1367972890-14439-1-git-send-email-sajesh@ti.com>
	<1367972890-14439-4-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367972890-14439-4-git-send-email-sajesh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] update to run lad at bootup
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
X-List-Received-Date: Wed, 08 May 2013 01:12:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Since this the first time you submit ti-ipc recipe, it is better to squash 
those 4 commits into one and submit a single patch...


On Tue, May 07, 2013 at 08:28:10PM -0400, Sajesh Kumar Saran wrote:
> ---
>  .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |   16 ++++++++++---
>  .../recipes-bsp/ti-ipc/tiipclad-daemon.sh          |   24 ++++++++++++++++++++
>  2 files changed, 37 insertions(+), 3 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
> index d127020..92f54c0 100644
> --- a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
> @@ -12,12 +12,12 @@ SECTION = "console"
>  COMPATIBLE_MACHINE = "keystone"
>  TARGET_PLATFORM = "tci6638"
>  
> -PR = "r19"
> +PR = "r21"
>  
>  BRANCH ?= "master"
>  SRCREV = "3.00.00.16_eng"
>  
> -SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} file://tiipclad-daemon.sh"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -33,4 +33,14 @@ FILES_${PN}-test = "${bindir}/NameServerApp_${TARGET_PLATFORM} \
>  					${bindir}/MessageQBench_${TARGET_PLATFORM} \
>  					${bindir}/ping_rpmsg"
>  
> -inherit autotools
> \ No newline at end of file

Can you try to avoid the above warning?


> +inherit autotools
> +
> +INITSCRIPT_NAME = "tiipclad-daemon.sh"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
> +inherit update-rc.d
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +}
> \ No newline at end of file

Same here.


> diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh b/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh
> new file mode 100755
> index 0000000..54b3888
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-ipc/tiipclad-daemon.sh
> @@ -0,0 +1,24 @@
> +#! /bin/sh
> +
> +tiipclad_daemon=/usr/bin/lad_tci6638
> +tiipclad_params=lad.txt
> +
> +test -x "$tiipclad_daemon" || exit 0
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting tiipclad daemon"
> +    start-stop-daemon --start --quiet --exec $tiipclad_daemon $tiipclad_params
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping tiipclad daemon"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/tiipclad.pid
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/tiipclad-daemon.sh {start|stop}"
> +    exit 1
> +esac
> +
> +exit 0
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

