Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 66DCF520E5
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2020 16:58:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099GtXUv099656;
	Fri, 9 Oct 2020 11:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602262533;
	bh=foAFhpyPGiBL4mzmFv9ew8COIGPd+DE+wD68SHaDHC4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dUbP05FH1FuAmPGdy7JeHBA84Fz0UV/q/WxyimP1o0mGMJR0eHMvhK7jJdc3UL6ZR
	8MBo1f6Qbc2Ec9I2nqztUJRAFeEDKX2A/o2/MLTaXb0mZhCsw5Zpo2e2KU/GCvaYVA
	Ph09oQv08p/SkDFqA6avDJxpGVdsbq8wY1L1rAY4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099GtX0G053659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2020 11:55:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 9 Oct 2020 11:55:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 9 Oct 2020 11:55:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099GtWIV034712;
	Fri, 9 Oct 2020 11:55:32 -0500
Date: Fri, 9 Oct 2020 12:55:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201009165532.GL23230@beryl>
References: <1602200774-36217-1-git-send-email-denis@denix.org>
	<944204e8-f5b4-e6cc-2f3b-d7fac3503861@ti.com>
MIME-Version: 1.0
In-Reply-To: <944204e8-f5b4-e6cc-2f3b-d7fac3503861@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] distroless/poky: also define TI_SECURE_DEV_PKG variables for HS devices
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
X-List-Received-Date: Fri, 09 Oct 2020 16:58:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 09, 2020 at 07:04:02AM -0500, Dan Murphy wrote:
> Denys
> 
> On 10/8/20 6:46 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> 
> This fails to apply to dunfell-next.

It is meant for tisdk-build-scripts per subject prefix.

Denys

