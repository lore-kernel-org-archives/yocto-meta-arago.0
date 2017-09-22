Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7AAAF52A65
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 17:55:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MHtjKQ001101
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 12:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506102945;
	bh=8Nt2BeMzpz6wD1AWO7qsEn+WOVm0FWKBHhAvLmxogcQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=INPiMXEoBE7iscumGDQqSHv23KbZDNDA4NSCRo6OPzRbA3cM9johIekqUZ8aKzlh1
	hwbImMtY1n0O+Ne9OTWsX92xAJ6/MGFZiHnGwZGOpDpLqpR1QJb3xDXV3o7RN/mLhP
	pTHo3Df2N3C1HNaUNWnBJZ6zl79NgTNmJAmZCzEI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MHtj3Q014858
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 12:55:45 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 12:55:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 12:55:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MHtj81022756;
	Fri, 22 Sep 2017 12:55:45 -0500
Date: Fri, 22 Sep 2017 13:55:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170922175529.GO26843@edge>
References: <1506098041-19036-1-git-send-email-a0271529@ti.com>
	<77949247-bfd4-6b7c-820a-66780bd83768@ti.com>
MIME-Version: 1.0
In-Reply-To: <77949247-bfd4-6b7c-820a-66780bd83768@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Hongmei Gou <a0271529@ti.com>
Subject: Re: [meta-processsor-sdk] [PATCH] prueth-fw: update the firmwares to 5.1.4
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
X-List-Received-Date: Fri, 22 Sep 2017 17:55:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 22, 2017 at 12:49:11PM -0500, Dan Murphy wrote:
> On 09/22/2017 11:34 AM, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  recipes-bsp/prueth-fw/prueth-fw_git.bbappend | 4 ++++
> >  1 file changed, 4 insertions(+)
> >  create mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> > 
> > diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bbappend b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> > new file mode 100644
> > index 0000000..6e8ca3e
> > --- /dev/null
> > +++ b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> > @@ -0,0 +1,4 @@
> > +PV = "5.1.4"
> > +PR = "r0"
> > +
> > +SRCREV = "b9d9e4bef2f32d4b55a63ecfec2e21f7b1eaaa34"
> > 
> 
> NACK!!!!!!!!!!!!!

Dan,

Please note the [meta-processor-sdk] modifier in the subject - it goes to that 
layer and won't affect 2017.04 release.

-- 
Denys

