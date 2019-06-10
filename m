Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5A5DF520E0
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 17:15:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHFDes057845;
	Mon, 10 Jun 2019 12:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560186913;
	bh=5KBOkFi6J16t5Ky+XfXjcBAbH0ci9GTrei+MfXo57dU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cRjt3ECN1gPAaq2MHTuFIZWpHbdaKisDj68VRcSsiiRI4xkacPWg6podkmcNAxLUH
	KnqeFBAu5mtWJwSJug8Q6qJmG7n8NZVlQvQRwoCVqF5GAmzhGfjwKzynBJHS3uB2nI
	pDX98x9yZ+L/+M/xWx0Kuox2s9wWY1Fi5JOwQgZI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHFDjP049766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2019 12:15:13 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 12:15:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 12:15:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHFCAO055846;
	Mon, 10 Jun 2019 12:15:12 -0500
Date: Mon, 10 Jun 2019 13:15:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190610171512.GE25589@beryl>
References: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: Upcoming stable branch
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
X-List-Received-Date: Mon, 10 Jun 2019 17:15:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

No plans for warrior - we are on a single LTS per year schedule, picking up 
only Fall even releases and skipping Spring odd ones.

Denys


On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:
> Hi,
> 
> We are planning to upgrade arago distro in our product.
> At this point, I can only see thud branch in meta-arago whereas warrior is
> available in oe-core.
> 
> Is there any plan for warrior in meta-arago or is it being skipped?
> What is the difference between thud and thud-next?
> 
> Thanks
> Ankur

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


