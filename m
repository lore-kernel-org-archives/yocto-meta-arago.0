Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 284FE529EB
	for <meta-arago@arago-project.org>;
	Thu, 31 Aug 2017 19:02:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VJ2mJt007051
	for <meta-arago@arago-project.org>; Thu, 31 Aug 2017 14:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504206168;
	bh=BdXNlinCmlcpMoZXrD0LOEtVx02jiEMNV0Yi90xCg1A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qXRaN8xv980SrJ335ks70hZ8DqB4NMH+2Xcg0yztsNo16PpCCCnBdtYBNd3Uyq2lt
	/rFyae5l16jNKmbPb3WjazFgxBrTh8hMYD5AAt/qxtGJ8Ut56ZIYP1QGDGlcILKzdf
	nEZPt9GMYwfuxb1WxSnC01TJ/JL2gJ5ZGgpwK8J8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VJ2mrU015029
	for <meta-arago@arago-project.org>; Thu, 31 Aug 2017 14:02:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 14:02:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 14:02:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VJ2mQf010131;
	Thu, 31 Aug 2017 14:02:48 -0500
Date: Thu, 31 Aug 2017 15:02:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170831190244.GB8304@edge>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v3 1/7] evse-hmi : add new demo
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
X-List-Received-Date: Thu, 31 Aug 2017 19:02:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks. The entire series now looks good. Though your separate patch for 
tisdk-rootfs-image should have been part of this series as well, somewhere 
between patch #6 and #7...

-- 
Denys


On Wed, Aug 30, 2017 at 12:56:41PM -0500, Manisha Agrawal wrote:
> EVSE stands for electronic vehicle supply station.  This demo is created as part
> of TID on EVSE to demonsrate drawing the gui for EVSE application using QT
> QWidget and rendering on LCD panel using  linuxfb QPA.
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> 
> diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 00000000..27a58a96
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}
> -- 
> 2.13.0
> 

