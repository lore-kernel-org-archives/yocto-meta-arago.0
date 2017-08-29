Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id AA76B52AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:17:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THH4ns013626
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504027024;
	bh=8SVNPfxzu13piPhMAUk9uOlGgQCqyctUe3CuZpdXfNM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cQnukuB1nkOOFoToasIFWhFogWmIrXc63oVQPNy0vyVg0Nzpfoj9gBwV6NQn+0Tfq
	vv/7vlVXgxNXQEt+O0SYiQHZNNwsFKvcgjSrARnI2LylS5yaG6WcwIE3EXwqjRE8eu
	GeXWW67g2S7HHojBR420yMzVZ2KMXE3Cxkd94BuI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THH475026403
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:17:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:17:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:17:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THH4Nl027687;
	Tue, 29 Aug 2017 12:17:04 -0500
Date: Tue, 29 Aug 2017 13:16:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829171659.GE8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-4-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-4-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 4/6] recipes-core : packagegroups: hmi
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
X-List-Received-Date: Tue, 29 Aug 2017 17:17:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Manisha,

From this:

> recipes-core : packagegroups: hmi

To this:

> packagegroup-*-hmi: add hmi specific packagegroups


On Tue, Aug 29, 2017 at 11:38:24AM -0500, Manisha Agrawal wrote:
> Create packagegroup for HMI related demos. HMI is one of the focus
> growth area for Sitara platform and demos planned for individual target end
> equipments. Add evse-hmi demo to the packagegroup.
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 26 +++++++++++++++++++++
>  .../packagegroups/packagegroup-arago-tisdk-hmi.bb  | 27 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
>  create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> new file mode 100755
> index 0000000..d58536c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Task to add HMI related sources into the SDK"

SUMMARY is missing.


> +LICENSE = "BSD-3-Clause"

By default all OE metadata is licensed under MIT. Unless you have a very 
specific need to license packagegroup under BSD, I'd suggest leaving it as is. 
BTW since MIT is default, LICENSE can be omitted when inheriting packagegroup.


> +PR = "r1"

Not critical, but PR can also be omitted for new recipes.


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +HMI = ""
> +
> +HMI_append_ti43x = " \
> +    evse-hmi-src \
> +"
> +
> +HMI_append_ti33x = " \
> +    evse-hmi-src \
> +"
> +
> +
> +HMI_append_omap-a15 = " \
> +    evse-hmi-src \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${HMI} \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> new file mode 100755
> index 0000000..9066c72
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> @@ -0,0 +1,27 @@

Same comments here.


> +DESCRIPTION = "Task to add HMI related packages"
> +LICENSE = "BSD-3-Clause"
> +PR = "r1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +HMI = " \
> +"
> +
> +
> +HMI_append_ti33x = " \
> +    evse-hmi \
> +"
> +
> +HMI_append_ti43x = " \
> +    evse-hmi \
> +"
> +
> +HMI_append_omap-a15 = " \
> +    evse-hmi \
> +"
> +
> +
> +RDEPENDS_${PN} = "\
> +"
> -- 
> 2.13.0
> 

