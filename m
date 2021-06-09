Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7AA4E52A2A
	for <meta-arago@arago-project.org>;
	Wed,  9 Jun 2021 12:57:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 159CwBFC110481
	for <meta-arago@arago-project.org>; Wed, 9 Jun 2021 07:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623243491;
	bh=/g4vGGa2fLJ3Gg6TEuQFVombzPvmBhVPYWASb4ME8qw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LnjhoR3WrgIsbvjYYYyEEkipxUu5vxPEHLL75CXEy1+407eNWpH2kk/uZ3tAHj4xJ
	jxeJujiFwU0evLK8Ic+/s0ixnPywfOHgN+m0kouCRWy0WEVb9kBnRmjd7XH9Wwr/gm
	Se1tAtH2TdRP2SsmxwHYpatU6p4yfHO0euiCCsyk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 159CwBhg096305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 9 Jun 2021 07:58:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 9 Jun 2021 07:58:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 9 Jun 2021 07:58:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 159Cw9SQ038822;
	Wed, 9 Jun 2021 07:58:10 -0500
Date: Wed, 9 Jun 2021 18:28:08 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210609125808.fnpe5oserkq3gydu@NiksLab>
References: <20210603032020.23448-1-a-m1@ti.com>
	<092132a2-c918-b0c6-ca4d-82239523dc6a@ti.com>
	<20210607212327.nejfsndlcwnpogpo@decorator>
	<20210608134442.wrpvzc6b2272sxrr@NiksLab>
	<20210608135221.z7gobp75bi64iyxe@dormitory>
MIME-Version: 1.0
In-Reply-To: <20210608135221.z7gobp75bi64iyxe@dormitory>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago PATCH] tisdk-core-bundle: Install sysfw.itb in the prebuilt-images directory
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
X-List-Received-Date: Wed, 09 Jun 2021 12:57:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 08:52-20210608, Nishanth Menon wrote:
> On 19:14-20210608, Nikhil Devshatwar wrote:
> > On 16:23-20210607, Nishanth Menon wrote:
> > > On 14:26-20210603, Vignesh Raghavendra wrote:
> > > > +praneeth
> > > > 
> > > > On 6/3/21 8:50 AM, Aparna M wrote:
> > > > > Install the sysfw.itb file in the prebuilt images directory of the
> > > > > tisdk-core-bundle package.
> > > > > 
> > > > 
> > > > Why do we need to package sysfw.itb given that its already part of
> > > > tiboot3.bin in case of am64x?
> > Vignesh,
> > 
> > This was done for consistency. It's no harm to include this.
> > It was a feedback on the SDK from the apps team.
> 
> The feedback is wrong. putting a random binary in the boot folder which
> does no function is broken understanding of the boot process - not to
> mention deployment and upgrade burden that we pitch on customers.

I was not aware if there is any case where the ITB would be required.
From your comment it seems it's not required at all.

Aparna,
Let us not add this in the installer. and also update the documentation to
specifically call out the contents of tiboot3.bin for AM64

Regards,
Nikhil D

> 
> > > NAK. We are using multi-certificate for am64x.
> > 
> > Pardon me for not knowing, What is a multi-certificate?
> 
> 
> multi-certificate x509 boot - where SPL, sysfw etc are packaged as part
> of tiboot3.bin.
> 
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

