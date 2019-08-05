Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 488675298A
	for <meta-arago@arago-project.org>;
	Mon,  5 Aug 2019 01:37:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x751aWjm080257;
	Sun, 4 Aug 2019 20:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564968992;
	bh=mdg/B+CKDZHtb7QrS7yl+Oi2rSUZrYbGuFBZTUOSPHg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RFUaQ1ENkTBG3dJKjYnbnytWlHSiFUi9oZyzBohhRW3daHfu8N2QiZjwn3+wBu0Aq
	uvpqiaK5zuZHXQM2mbVK87t6H2p9amWxYYtJC02zsO62vn2CflOg1CWLv+1j8IyjtN
	mHavvpjX0XjGSAsqxXKNurzG6Q2eOGwNWqiwrsno=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x751aWf2040004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Aug 2019 20:36:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 4 Aug 2019 20:36:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 4 Aug 2019 20:36:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x751aWKN018351;
	Sun, 4 Aug 2019 20:36:32 -0500
Date: Sun, 4 Aug 2019 21:36:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190805013631.GA19505@beryl>
References: <CADySD0Hx78etbUEEQJJuNScZU9hp1gHDoxyX_pKiJZt5O-DkWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0Hx78etbUEEQJJuNScZU9hp1gHDoxyX_pKiJZt5O-DkWQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: wpa-supplicant and hostap depends on openssl10
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
X-List-Received-Date: Mon, 05 Aug 2019 01:37:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 04, 2019 at 12:58:48PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> When building eSDK for arago based image, I am getting following error:
> 
> "The file /usr/include/openssl/comp.h is installed by both openssl10
> and openssl, aborting"
> 
> I checked who depends on openssl10 and only meta-arago wpa-supplicant,
> hostap depends whereas upstream depends on openssl.
> 
> Below commits show the change to depend on openssl10:
> 
> commit bc88360b: wpa-supplicant: inherit pkgconfig and depend on openssl10
> commit 8c3e159b: hostap: inherit pkgconfig and depend on openssl10
> 
> Any specific reason to still depend on openssl10?

Compatibility? OpenSSL 1.1 API is not 100% compatible with OpenSSL 1.0

-- 
Denys

