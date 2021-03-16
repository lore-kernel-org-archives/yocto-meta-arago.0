Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id CCCBA529A2
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 17:17:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GHI2WL107923;
	Tue, 16 Mar 2021 12:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615915082;
	bh=JfmAfQ12c/M0N3jKgk3wWM5k13UNieRdwcJlJZ/ZrU4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MN11CSSEGvlmQ0KhT0eP/KFBjWLbd94boF9KPbiWJ4JWtja/OYu7YV2A8HDn2U60i
	LQM/G8tlHByXdxkB/aLQkyFBkjLOyLHPBVXO9sNVsyv5ejyJXIQlkXc4JxhxJKjw9O
	CN9qwtj2Zg4W9QUJvb269Cqy+YzCa6eYaJ6+nZT0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GHI2eU010841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 12:18:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 12:18:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 12:18:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GHI1sL086167;
	Tue, 16 Mar 2021 12:18:01 -0500
Date: Tue, 16 Mar 2021 12:18:01 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
Message-ID: <20210316171801.l7ttk4ottbyocpzi@oxidize>
References: <20210316170857.9547-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210316170857.9547-1-nm@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH 0/2] arago-dunfell/dunfell-next: Move to
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
X-List-Received-Date: Tue, 16 Mar 2021 17:17:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:08-20210316, Nishanth Menon wrote:

I have no idea what ate up my $subject -> I intended to add "Move to
dunfell/dunfell-tip from upstream.

> 
> This brings arago-config and arago-next-config both in sync with latest
> dunfell and dunfell-next tips appropriately.
> 
> This series obviously will need to be followed up at an appropriate time
> with a stable commit sha patch to pin things up.

K, I might be missing the motivation here - the pinning may not be
required given that dunfell is always a rolling config.. and used only
in the cases of exceptions.. So, please ignore my comment.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

