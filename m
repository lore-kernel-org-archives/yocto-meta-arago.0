Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C7EFA529B9
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2019 03:13:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A3CGEh040478
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2019 22:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570677136;
	bh=s220bSFOynaxWkC0lD8tBROGePPdfnnSRmUqiQoIqns=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CD3gWVF5rq3MXOykVaBZDxA62LwWwOKpDnsppCkzbfmEAVudc60LZNwHzcBjHSS6D
	40nUAMY4kEtm6/TUTsaFJjTj0Mmc8tvo9Ml+7zr7cmdmIcPb2OnT7VeMwcdPhykjRf
	D2ghaIG6PuBnm/kJgz+8GTwLXkk9h2Z82ZAMMCfI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A3CGPT043471
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2019 22:12:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 9 Oct 2019 22:12:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 9 Oct 2019 22:12:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A3CFhv115911;
	Wed, 9 Oct 2019 22:12:15 -0500
Date: Wed, 9 Oct 2019 23:12:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <20191010031215.GB2144@beryl>
References: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
	<a686ea51-dae2-f6f5-91a1-9daa08dfb41b@ti.com>
	<e3a8c2b5-fce9-f660-4ffa-9efb43ffbf8b@ti.com>
MIME-Version: 1.0
In-Reply-To: <e3a8c2b5-fce9-f660-4ffa-9efb43ffbf8b@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts] [PATCH v1] setup-package-install: Add flex and libssl-dev packages
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
X-List-Received-Date: Thu, 10 Oct 2019 03:13:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 07, 2019 at 04:41:14PM +0530, Nikhil Devshatwar wrote:
> On 03/10/19 7:04 PM, Nikhil Devshatwar wrote:
> >On 01/10/19 8:02 PM, Nikhil Devshatwar wrote:
> >>For building kernel binaries, host machine should have flex and
> >>libssl-dev packages installed.
> >>
> >>Add these to list of packages.
> >>
> >>Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >ping
> Jacob/Denys,
> Please merge this

Jake should be back in the office now, so I'll leave this to him as a primary 
maintainer of tisdk-setup-scripts - I'm only secondary/backup for that repo.

Denys


> Nikhil D
> 
> >
> >Nikhil D
> >>---
> >>  setup-package-install.sh | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/setup-package-install.sh b/setup-package-install.sh
> >>index 1e9fedb..922e504 100644
> >>--- a/setup-package-install.sh
> >>+++ b/setup-package-install.sh
> >>@@ -56,7 +56,7 @@ cwd=`dirname $0`
> >>    entry_header
> >>  -packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
> >>+packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop flex libssl-dev"
> >>    get_major_host_version host_major_version
> >
> 

