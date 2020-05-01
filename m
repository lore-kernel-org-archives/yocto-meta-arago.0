Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0472652A30
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2020 01:51:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0411nUAD082456;
	Thu, 30 Apr 2020 20:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588297770;
	bh=ezW18hgI1tBCBvuTPWMJVnRUPuKmij2uaM4mxXX4sTY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RaQg98kgdYtljXm4RJpzWspLTDU0D/OVjYjQxBkqAcBEWrf2qjcdFx0PqF2nLXhaA
	8DQvI7olpu9WmbevOGy9XDLDyGF0Bn1aWg5aYLZIFuLUz1l3ZswpDpHt+tdTPQ6uHU
	R3qWdgMNqh5Za5BT55rgnDXrIfjX/utuwl4uf5TQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0411nUud104096;
	Thu, 30 Apr 2020 20:49:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Apr 2020 20:49:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Apr 2020 20:49:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0411nUp0105291;
	Thu, 30 Apr 2020 20:49:30 -0500
Date: Thu, 30 Apr 2020 21:49:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200501014929.GG11212@beryl>
References: <CAM9ZRVvLaQTzUH29DauqEgSuw21iRrKneGqB8i0SXy3OvW-08g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVvLaQTzUH29DauqEgSuw21iRrKneGqB8i0SXy3OvW-08g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Subject: Re: Arago & meta-ti support for Yocto Project LTS release
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
X-List-Received-Date: Fri, 01 May 2020 01:51:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Paul,

Yes, dunfell will be officially supported. I should be branching off within 
days - still waiting on all the dependeices.

Whether it will be full 2 years support or not - I'm not sure yet.

Denys


On Wed, Apr 29, 2020 at 09:33:22AM +0100, Paul Barker wrote:
> Hi folks,
> 
> Is there a plan to support the new Yocto Project LTS release (dunfell)
> for Arago distro and meta-ti? I know usually every other Yocto Project
> release is supported, zeus was supported so usually dunfell wouldn't
> be.
> 
> If so, are you planning to support this for the full LTS period of 2 years?
> 
> I imagine this will be supported but would be good to get confirmation.
> 
> Thanks,
> Paul
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

