Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 6564A52AAC
	for <meta-arago@arago-project.org>;
	Tue, 13 Jul 2021 13:29:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DDU6YX082370;
	Tue, 13 Jul 2021 08:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626183006;
	bh=eAHan7GFfaQEB8vXZlFG93GLGfbT7DXH3fCkVfpwFu8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jq7kuWFjIGUmcpiw+lyPptkZ9eVPuinArHbnZ6bjSOwUA6bB6gfkmKQpt2QOLcYBp
	YePROmNZ2vPUOYsR1XDvW1Qq+YUV8IUDdXrhyC0VXEfMjKxMM0fv8CbhuKQOUiVi6v
	Wu8iOPlNzXprLnUwl8xgTYPeDXIiMLa+jr5w7izc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DDU56X123748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jul 2021 08:30:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 13 Jul 2021 08:30:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 13 Jul 2021 08:30:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DDU4vf127613;
	Tue, 13 Jul 2021 08:30:04 -0500
Date: Tue, 13 Jul 2021 08:30:03 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210713133003.esixjjs6zza37zya@excusably>
References: <20210709180401.2977-1-nm@ti.com> <20210709180401.2977-6-nm@ti.com>
	<20210713033248.GU1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210713033248.GU1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts PATCH 5/5] config-build-env: Switch arago-project git repo to ti git repo
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
X-List-Received-Date: Tue, 13 Jul 2021 13:29:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 23:32-20210712, Denys Dmytriyenko wrote:
> On Fri, Jul 09, 2021 at 01:04:01PM -0500, Nishanth Menon wrote:
> > Arago-project is on the way down, so flip over to git.ti.com repo
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  lib/oesdk/config-build-env | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
> > index cdfa6830eb51..2514acbe6b38 100644
> > --- a/lib/oesdk/config-build-env
> > +++ b/lib/oesdk/config-build-env
> > @@ -1,6 +1,6 @@
> >  #!/bin/bash
> >  
> > -TI_SDK_OELAYER_SETUP="http://arago-project.org/git/projects/oe-layersetup.git"
> > +TI_SDK_OELAYER_SETUP="http://git.ti.com/git/arago-project/oe-layersetup.git"
> 
> What's the preferred clone method on git.ti.com? I see Web UI shows these:
> 
> Clone
> https://git.ti.com/git/arago-project/oe-layersetup.git
> https://git.ti.com/cgit/arago-project/oe-layersetup
> git://git.ti.com/arago-project/oe-layersetup.git
> http://git.ti.com/git/arago-project/oe-layersetup.git

Have'nt heard of any specific preference.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

