Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D4AB752A0B
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 17:04:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NH3xfP092609;
	Thu, 23 Aug 2018 12:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535043839;
	bh=k41PiMSEmlKRVWsolMtOu1rbEwByJjTHPNHHoj+zErw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qtc9WTN/vRmYYCdr1/c1wj0yJINqXX1h3DW38Gnxurytv7iMMZla4fgqyAyvBvMZs
	ga+OKs8yRxyHbjL1mFtTxUxi/orrGqrjnTB+jV9C8D+vh1aA37zv8izygThvSfiNPA
	AeMYfsW9NmtfydZqmlmtnMXbgT+OAO/PVzNrlkGs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NH3xIl029740;
	Thu, 23 Aug 2018 12:03:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 12:03:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 12:03:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NH3wdU022568;
	Thu, 23 Aug 2018 12:03:58 -0500
Date: Thu, 23 Aug 2018 13:03:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20180823170304.GT29422@beryl>
References: <CADySD0FuPUPG5qwFC8Ao2eiKVtYhE8Gq9N-0RMvFZk0RKp=d+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0FuPUPG5qwFC8Ao2eiKVtYhE8Gq9N-0RMvFZk0RKp=d+A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: How to submit patch for ti-u-boot.git
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
X-List-Received-Date: Thu, 23 Aug 2018 17:04:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can it go upstream to mainline U-boot at DENX?

On Thu, Aug 23, 2018 at 11:29:11AM +1200, Ankur Tyagi wrote:
> Hi,
> 
> I want to submit a patch series for TI u-boot.
> Don't know to which mailing list shall I post them.
> 
> Thanks
> Ankur

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


