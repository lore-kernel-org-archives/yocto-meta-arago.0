Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 1A580529EA
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 15:12:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4GFCvmp017923
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 10:12:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GFCubJ027328
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 10:12:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 May 2016 10:12:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GFCuPF025264;
	Mon, 16 May 2016 10:12:56 -0500
Date: Mon, 16 May 2016 11:12:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20160516151240.GG16188@edge>
References: <1463390723-32245-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1463390723-32245-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] weston-init: add dependency on SGX DDK service
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
X-List-Received-Date: Mon, 16 May 2016 15:12:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

This only solves one problem out of many - dependency on rc.pvr
Unless we rewrite the entirety of our custom weston init and runWeston 
scripts to become systemd units, we won't get all the fixes, workarounds 
and customizations we've added in the past years - calibration handling 
being the major of them...

-- 
Denys


On Mon, May 16, 2016 at 02:55:23PM +0530, Anand Balagopalakrishnan wrote:
> - systemd starts Weston service much before DDK initialization
> - Ensure that Weston service is started *after rc.pvr.service
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  .../wayland/weston-init/weston.service             |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> new file mode 100644
> index 0000000..401c10e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=Weston Wayland compositor startup
> +RequiresMountsFor=/run
> +After=rc.pvr.service
> +
> +[Service]
> +User=root
> +EnvironmentFile=-/etc/default/weston
> +Environment="XDG_RUNTIME_DIR=/run/user/root"
> +ExecStartPre=/bin/mkdir -p /run/user/root
> +ExecStartPre=/bin/chmod 0700 /run/user/root
> +ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

