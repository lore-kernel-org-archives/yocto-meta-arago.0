Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 96561529B7
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 21:12:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TLB4Sj003593
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572383464;
	bh=GgKa1+YzTLe7QvEDvxj59XkpCfddYPH/NPuvYpahmqc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lqcBPpOj+uV2+m5geb2VhdG5wfrypjMVuWu6GLsWscgIP3n0ylO7lXfFCtaNIuT13
	+6Oa0Zc37Cl2S0Wtz0wrw73C3mdlJBNHFLIGwtcguvEVl5TrYUthoHjb32ErDpDJhD
	xLm+gW0CXonmxNstrWzEMpLAPuQd1WIwSqDBCjyM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TLB3ta000845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 16:11:04 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 16:10:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 16:10:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TLB2Wi121482;
	Tue, 29 Oct 2019 16:11:03 -0500
Date: Tue, 29 Oct 2019 17:11:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191029211102.GH7518@beryl>
References: <20191029135521.42434-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191029135521.42434-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Tue, 29 Oct 2019 21:12:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 29, 2019 at 09:55:21AM -0400, Eric Ruei wrote:
> This is required because the default value of x11 is true if not specified.
> 
> Upstream Status: Accepted

Wrong use of Upstream-Status. What you want to say is that this change is 
already in upstream master/zeus and is only needed temporarily in thud.


> glneo authored and rpurdie committed Sep 13, 2019
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-graphics/libepoxy/libepoxy_%.bbappend              | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100755 meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> new file mode 100755
> index 00000000..15c373cd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".arago0"
> +
> +PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

