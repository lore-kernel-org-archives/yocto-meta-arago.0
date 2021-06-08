Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 2C9A8529F0
	for <meta-arago@arago-project.org>;
	Tue,  8 Jun 2021 13:44:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 158DiicB124714
	for <meta-arago@arago-project.org>; Tue, 8 Jun 2021 08:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623159884;
	bh=C+lFa5KIsFr+T7c8DN6HK54EOkaF0DnkLxh9mDjXSzg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AN/iBopScjJ3zNBxNIsvfI/ewjlOw2AiEvyu3SxKc+81C9cbz9N6gRfwKrRQDQiia
	3Ztahn+JBHNwzb9xhYBj6Ug8CwXHq7XYu+xZXs00bb8JXZ89naHhCPYcAUum885+1l
	SN0rrUYKMvH0HjZCnutKntm4V8UEi+78fmEAQ0cc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 158Diit9076742
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 8 Jun 2021 08:44:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 8 Jun 2021 08:44:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 8 Jun 2021 08:44:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 158DihPU037440;
	Tue, 8 Jun 2021 08:44:44 -0500
Date: Tue, 8 Jun 2021 19:14:42 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210608134442.wrpvzc6b2272sxrr@NiksLab>
References: <20210603032020.23448-1-a-m1@ti.com>
	<092132a2-c918-b0c6-ca4d-82239523dc6a@ti.com>
	<20210607212327.nejfsndlcwnpogpo@decorator>
MIME-Version: 1.0
In-Reply-To: <20210607212327.nejfsndlcwnpogpo@decorator>
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
X-List-Received-Date: Tue, 08 Jun 2021 13:44:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:23-20210607, Nishanth Menon wrote:
> On 14:26-20210603, Vignesh Raghavendra wrote:
> > +praneeth
> > 
> > On 6/3/21 8:50 AM, Aparna M wrote:
> > > Install the sysfw.itb file in the prebuilt images directory of the
> > > tisdk-core-bundle package.
> > > 
> > 
> > Why do we need to package sysfw.itb given that its already part of
> > tiboot3.bin in case of am64x?
Vignesh,

This was done for consistency. It's no harm to include this.
It was a feedback on the SDK from the apps team.

> 
> 
> NAK. We are using multi-certificate for am64x.

Pardon me for not knowing, What is a multi-certificate?

Regards,
Nikhil D

> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

