Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 93994529F0
	for <meta-arago@arago-project.org>;
	Tue, 25 May 2021 16:02:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PG35aZ045472;
	Tue, 25 May 2021 11:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621958585;
	bh=H3vxZxC3mb9dPKLJrgj2HXYlkaJWtb/+FXrVP4co8pE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jXzu8aeIVnuyFol0QKmAMMtwi1tEJv7z7sr2LybCyENFwwXWIDhJBgjBTCMLy4DIO
	LfYO48iJcKcPsBuS6IS+DgorZVZm7oFr7FBVGnJ4acPKWjzsGPqyMsGTG5D5+1UjWk
	JnZutvpG/xm0MDxb27s9XsKGW0vU80EmAHMVmXYw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PG35Ma039279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 May 2021 11:03:05 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 25 May 2021 11:03:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 25 May 2021 11:03:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PG35Cs070636;
	Tue, 25 May 2021 11:03:05 -0500
Date: Tue, 25 May 2021 11:03:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <20210525160305.d2v7kora7kbi2rm6@during>
References: <20210525160019.28175-1-denys@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210525160019.28175-1-denys@konsulko.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH] linuxptp: update bbappend against latest upstream
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
X-List-Received-Date: Tue, 25 May 2021 16:02:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 11:00-20210525, Denys Dmytriyenko wrote:
> Back-porting upstream patch for dunfell. The dunfell linux-ptp is
> still at 2.0. This forks linuxptp to 3.0 to update it for the linux
> ptp fixes done on meta-openembedded
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../recipes-connectivity/linuxptp/linuxptp_%.bbappend       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> index b0552aaf..e4fb109a 100644
> --- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> @@ -1,13 +1,13 @@
>  PR_append = ".arago0"
> -PV_append = "+git${SRCPV}"
> +PV = "3.0+git${SRCPV}"
>  
>  BRANCH = "ti-linuxptp"
> -SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"
> +SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
>  
>  SRC_URI = " \
>      git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
>      file://build-Allow-CC-and-prefix-to-be-overriden.patch \
> -    file://no-incdefs-using-host-headers.patch \
> +    file://Use-cross-cpp-in-incdefs.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.17.1
> 

Nitpicking on $subject..
http://arago-project.org/git/meta-arago.git?p=meta-arago.git;a=blobdiff;f=meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%25.bbappend;h=e4fb109a5b1dcc16e52aec24c61386fde1e871df;hp=b0552aaf41528735a697946f60a432378d6c5cb8;hb=dc1101ed36094749219285378a73f660255e3cbd;hpb=df231e190a3c138696c15faa88f7cb228c2cc585
is already on master, so just dunfell alone.


Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

