Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A0BD1520E2
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 18:12:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CIBKuk092020
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568311880;
	bh=LGvc+AzA8uHBR7MkZ+2+xQd/QHwbqPJbOTQbz/6uDcM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eDHF9mIq4327E/r+eCWKvq8MM8tF7sv5WiEiQUawEWiKZm1ZGLmrsHyieFq6z3Bmc
	sdi1ataHf6+RjEjzTFsbE9suLyRXIDMxHqdci4zhcKYQc69Hz9ew2vwqrbOL/lG2IG
	PHk9A78xHqkoGvwdFzURlEQeJr+0RDgLSemGKJV4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CIBKCC054918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:11:20 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 13:11:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 13:11:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CIBKhg096001;
	Thu, 12 Sep 2019 13:11:20 -0500
Date: Thu, 12 Sep 2019 14:11:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190912181119.GH28369@beryl>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
	<1568302717-46518-26-git-send-email-denys@ti.com>
	<b863f54e-6365-efd1-904a-f643e9c3f3e0@ti.com>
MIME-Version: 1.0
In-Reply-To: <b863f54e-6365-efd1-904a-f643e9c3f3e0@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [master][PATCH 25/32] opencv: require "dsp" machine feature
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
X-List-Received-Date: Thu, 12 Sep 2019 18:12:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

It may not be necessary, but I was not able to build the other opencv 
dependencies when opencl is not enabled. This could be a hack for now.


On Thu, Sep 12, 2019 at 01:26:21PM -0400, Jacob Stiffler wrote:
> Is this necessary?
> 
> In the 3.1 bbappend we configure with opencl only if dsp is in the
> MACHINE_FEATURES. That way we can still use opencv even if the dsp is not a
> MACHINE_FEATURE.
> 
> On 9/12/2019 11:38 AM, Denys Dmytriyenko wrote:
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  meta-arago-distro/recipes-support/opencv/opencv_%.bbappend | 3 +++
> >  1 file changed, 3 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> >new file mode 100644
> >index 0000000..bc885a4
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> >@@ -0,0 +1,3 @@
> >+inherit machine_features_check
> >+
> >+REQUIRED_MACHINE_FEATURES = "dsp"

