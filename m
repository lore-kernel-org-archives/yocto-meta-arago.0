Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 32D8D529A4
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2012 01:49:08 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q931n7bj024972
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 20:49:07 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q931n7jG006915
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 20:49:07 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Oct 2012 20:49:06 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q931n6N8023566;
	Tue, 2 Oct 2012 20:49:07 -0500
Date: Tue, 2 Oct 2012 21:49:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121003014906.GD32243@edge>
References: <8F29D6B095ED194EA1980491A5E029710C2F57E0@DFLE09.ent.ti.com>
	<20121003005937.GC32243@edge>
	<8F29D6B095ED194EA1980491A5E029710C2F589A@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2F589A@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: python-m2crypto-native broken
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
X-List-Received-Date: Wed, 03 Oct 2012 01:49:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 02, 2012 at 09:11:06PM -0400, Cooper Jr., Franklin wrote:
> I tried doing a cleanall on python-m2crypto-native and python-m2crypto since 
> I figured that might be the potential issue. That did not solve the issue. 
> The weird part is that it isn't a actually compile error it is a patch 
> error. Is there something else I can try instead of deleting my entire temp 
> directory?

Well, I don't think it has anything to do with the recent change, but rather 
looks like the recipe is bad - when building from scratch, it first fails on 
the bad checksums, and then when checksums are corrected, fails to apply the 
first patch. Doing so manually fails the same way. So, I'm wondering how it 
used to work for you before, but that's why it still works when re-using the 
old temp/work directory...

-- 
Denys

