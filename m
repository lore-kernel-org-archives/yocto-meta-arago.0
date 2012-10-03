Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 44CE1529AA
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2012 00:59:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q930xcaT021078
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 19:59:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q930xchL026377
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 19:59:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Oct 2012 19:59:37 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q930xbfU011784;
	Tue, 2 Oct 2012 19:59:37 -0500
Date: Tue, 2 Oct 2012 20:59:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121003005937.GC32243@edge>
References: <8F29D6B095ED194EA1980491A5E029710C2F57E0@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2F57E0@DFLE09.ent.ti.com>
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
X-List-Received-Date: Wed, 03 Oct 2012 00:59:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 03, 2012 at 12:32:58AM +0000, Cooper Jr., Franklin wrote:
> FYI commit http://arago-project.org/git/?p=meta-arago.git;a=commit;h=087566d0fefb1d1ccd8b44b964b6ed67720d5527 
> breaks python-m2crypto-native. For some reason the two patches from 
> python-m2crypto (install.patch and m2crypto-0.20.2-openssl-1.0.0.patch) 
> fails to apply. Removing the toolchain patch above fixes this problem.

Please do a clean build - the temp directory got changed.

-- 
Denys

