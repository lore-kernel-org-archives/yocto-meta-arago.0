Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 162CB529A9
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2019 03:03:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9F32OjD067681
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 22:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571108544;
	bh=Sql0Wj1HTsrXY9TRlptGncyknSB6V2Q5I5PTxYC9Hgk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=elKjONOXt8ywrgAwmbF6VAhLJnVnrpMqkuT3JMx0aJKOflaEwSeC41X1E3bCMD8Ay
	MlP73+42lT8dasxrdCl1GQxbKBWAmlDL+Q3lMUm7V37q/6gofQqJYugmKpuSqt4oYK
	AWsyfuzm08kFEI7hT3n0J2bjiElEAv791Bdd9Px4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9F32Ogl066350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 22:02:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 22:02:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 22:02:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9F32ORQ068623;
	Mon, 14 Oct 2019 22:02:24 -0500
Date: Mon, 14 Oct 2019 23:02:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <20191015030223.GH14271@beryl>
References: <1d7507c5-ffa0-eeec-3575-5e42f1d14473@ti.com>
MIME-Version: 1.0
In-Reply-To: <1d7507c5-ffa0-eeec-3575-5e42f1d14473@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: KERNEL_DEVICETREE_append in custom layer does not take effect in ti-tisdk-makefile
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
X-List-Received-Date: Tue, 15 Oct 2019 03:03:40 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 14, 2019 at 05:58:50PM +0530, Nikhil Devshatwar wrote:
> Hi Denys/Jacob,
> 
> I am appending the KERNEL_DEVICETREE variable in the  meta-psdkla layer 
> linux-ti-staging_%.bbappend recipe

Nikhil,

You are appending the variable in a recipe - it will have the scope of that 
recipe only.


> All the additional DTB files get built correctly but the ti-tisdk-makefile 
> recipe cannot replace the Makefile with the updated variable.
> 
> Instead, it replaces the Makefile with old value of KERNEL_DEVICETREE
> 
> How is this happening? Can you please help me with how to achieve the same?

In order to change the variable to affect all the recipes, you have to do it 
in one of the global config files.

-- 
Denys

