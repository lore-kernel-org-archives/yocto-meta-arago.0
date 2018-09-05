Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E073B52985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 18:38:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85Ic0Ec055671
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536172680;
	bh=7hiOrGPGNgD6SU97x1mdKQsl52B1MOKBVlJWRTCAPJk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z5V+GZPRSoV8giFjrzy+yixywQVEdBWhnw3cNUmSZhqF0H+GwN6zHbhDrhJP9/Wtj
	4SqjrKUdOx880T7wgOLPQqGKftFJckXyxHTRZSjPBPetMPe0QXmV/tYxoLgxtD3C7a
	L2hQzw5X1UKr54kcDpjaLDF+NLpiP9Jk7STmN55c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85Ic0hZ026169
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:38:00 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 13:38:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 5 Sep 2018 13:38:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85Ic0wc005544;
	Wed, 5 Sep 2018 13:38:00 -0500
Date: Wed, 5 Sep 2018 14:36:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20180905183626.GG13472@beryl>
References: <1536168915-10192-1-git-send-email-sam.nelson@ti.com>
	<8c063e36-6b83-c746-1e91-4a38e5268d11@ti.com>
MIME-Version: 1.0
In-Reply-To: <8c063e36-6b83-c746-1e91-4a38e5268d11@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko][PATCH] packagegroup-tisdk-addons: Add firmware images for am65xx-evm
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
X-List-Received-Date: Wed, 05 Sep 2018 18:38:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 05, 2018 at 12:44:00PM -0500, Suman Anna wrote:
> On 09/05/2018 12:35 PM, Sam Nelson wrote:
> > Provides ipc test images for r5f cores
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 5b97d77..d905402 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > @@ -102,6 +102,8 @@ UTILS_append_k2g = " \
> >      uio-test-pruss \
> >  "
> >  
> > +UTILS_append_am65xx-evm = " ti-ipc-rtos-fw"
> 
> I am not sure if arago and meta-ti uses different labels/platforms, but

No differences.


> should this be using the already existing UTILS_append_k3. I see that's
> what the PRU firmware images are using. I will let Denys comment on this
> more.

+1 with Suman.


> > +
> >  EXTRA_LIBS = ""
> >  EXTRA_LIBS_append_omap-a15 = " \
> >      cmem \
> > 
> 

