Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CCD3252ADE
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 20:26:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KKQf8e055748
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 15:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534796801;
	bh=ifrs5MqYiwnD8yCPXI36Pue1qg31Yszw/rjgPJr7H54=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KaqTqBeIq1we4FzXN3WDbCfLusrhqfdteClZWI2nTBuO+0ZMpmqXV29oET1X7gHeH
	yQEQucwDTSfPzlNP+0RkW+4Zrh7HcIdu5gFg0yoUPaes4e9zFeIjJEzoEC3ieXc4P6
	3mM5AGj0AKtb2I/jtB2bjQMLKCSCRKHyr3HUVw3I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKQfsb029004
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 15:26:41 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 15:26:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 15:26:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKQed2004666;
	Mon, 20 Aug 2018 15:26:40 -0500
Date: Mon, 20 Aug 2018 16:25:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180820202541.GF29422@beryl>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
	<1534515953-32644-4-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534515953-32644-4-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC 3/3] arago-prefs: enable SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Mon, 20 Aug 2018 20:26:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 17, 2018 at 10:25:53AM -0400, Jacob Stiffler wrote:
> * disable SECONDARY_TOOLCHAIN by default
> * For k3, configure the secondary toolchain as armv7a for the R5
>   cores.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index c839c9a..4e3e221 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -1,6 +1,9 @@
>  # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
>  include conf/distro/include/qt5-versions.inc
>  
> +SECONDARY_TARGET_ARCH = ""
> +SECONDARY_TARGET_ARCH_k3 = "armv7a"

Just a tiny comment here - this should probably go to arago.conf

I reserve arago-prefs.inc for all the PREFERRED_PROVIDER/VERSION settings.


>  # Use the latest version of ltp-ddt for kernel versions 3.8+
>  PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

