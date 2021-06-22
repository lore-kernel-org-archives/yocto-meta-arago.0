Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 729C552B59
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 08:40:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15M8fahr108424;
	Tue, 22 Jun 2021 03:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624351296;
	bh=dBWqk0n4nkOW+t423SXK6IvXtjwH7xnm6HSmxsJCWvA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xM0CRSvX3fwXoZUz2QX5Lc6jNBLY6XWZ78srSMvXiTrEIL7aPiXUiGhkyu9qWDbSF
	V1H0IcEunSbBlODZVjRSaQSr8cv5FFS3qyUZ6g7uRORS29s7VgX0ap4oFyIUOme788
	fzSHPk6fVXVKb4tre5gJjYh2x5mqr8lKnxu2dShY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15M8faZR099772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 03:41:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 03:41:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 03:41:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15M8fYaq029165;
	Tue, 22 Jun 2021 03:41:35 -0500
Date: Tue, 22 Jun 2021 14:11:28 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
Message-ID: <20210622084128.hfccsggtvg2nqsof@NiksLab>
References: <20210616132024.29566-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210616132024.29566-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master 0/2] Remove Jailhouse support
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
X-List-Received-Date: Tue, 22 Jun 2021 08:40:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:50-20210616, Nikhil Devshatwar wrote:
> This series removes the Jailhouse and corresponding recipes from
> meta-arago
> 
> Nikhil Devshatwar (2):
>   recipes-tisdk: tisdk-makefile: Remove Jailhouse snippet
>   conf: arago: Remove jailhouse references
> 

ping on this and other series for meta-ti as well

Regards,
Nikhil D

>  meta-arago-distro/conf/distro/arago.conf      |  3 --
>  .../conf/distro/include/arago-source-ipk.inc  |  7 ---
>  .../ti-tisdk-makefile/Makefile_jailhouse      | 44 -------------------
>  3 files changed, 54 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
> 
> -- 
> 2.17.1
> 

