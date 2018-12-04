Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D5BB0529A6
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:06:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4L5otm028917
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:05:50 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4L5o99048706
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:05:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:05:50 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 15:05:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4L5ob1022088;
	Tue, 4 Dec 2018 15:05:50 -0600
Date: Tue, 4 Dec 2018 16:05:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20181204210550.GU6887@beryl>
References: <1543955134-1464-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543955134-1464-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master] [PATCH v2] matrix-gui: update matrix-gui-2.0.service
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
X-List-Received-Date: Tue, 04 Dec 2018 21:06:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Dec 04, 2018 at 03:25:34PM -0500, Hongmei Gou wrote:
> * Add "Requires=weston.service" to make matrix-gui start only after
>   weston has successfully started
> 
> * Match matrix-gui-2.0.service with SysVinit auto-generated service
>   to ensure reliable matrxi-gui startup from booting
> 
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> V2 change:
>   Remove "Before=thermal-zone-init.service" per the review
> 
>  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service         | 8 ++++++++
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb           | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> index 3ce1024..40a8f0f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> @@ -1,9 +1,17 @@
>  [Unit]
>  Description=Matrix GUI
>  After=weston.service
> +Requires=weston.service
> +Before=graphical.target
>  
>  [Service]
>  Type=forking
> +Restart=no
> +TimeoutSec=5min
> +IgnoreSIGPIPE=no
> +KillMode=process
> +GuessMainPID=no
> +RemainAfterExit=yes
>  ExecStart=/etc/init.d/matrix-gui-2.0 start
>  
>  [Install]
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index c79f13e..064e27d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r36"
> +PR = "r37"
>  
>  SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

