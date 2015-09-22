Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 10B485297D
	for <meta-arago@arago-project.org>;
	Tue, 22 Sep 2015 15:25:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8MFPdgZ000790
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 10:25:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MFPdS0017675
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 10:25:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 10:25:40 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MFPdSJ014852;
	Tue, 22 Sep 2015 10:25:39 -0500
Message-ID: <560172F2.9040208@ti.com>
Date: Tue, 22 Sep 2015 11:25:38 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1442933128-20397-1-git-send-email-j-stiffler@ti.com>
	<1442933128-20397-3-git-send-email-j-stiffler@ti.com>
	<20150922152119.GA3425@edge>
In-Reply-To: <20150922152119.GA3425@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] matrix-gui-opencl-demos: Add for opencl matrix files.
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
X-List-Received-Date: Tue, 22 Sep 2015 15:25:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/22/2015 11:21 AM, Denys Dmytriyenko wrote:
> Are #2 and #3 in right order?

Yes. This recipe provides packages which rdepend on the submenu package.

>
> On Tue, Sep 22, 2015 at 10:45:28AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../matrix/matrix-gui-opencl-demos_2.0.bb          | 35 ++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
>> new file mode 100644
>> index 0000000..b645d89
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
>> @@ -0,0 +1,35 @@
>> +DESCRIPTION = "OpenCL demo descriptions for Matrix v2"
>> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>> +
>> +require matrix-gui-apps-git.inc
>> +
>> +PR = "${INC_PR}.2"
>> +
>> +inherit allarch
>> +
>> +S = "${WORKDIR}/git/opencl_apps"
>> +
>> +# Make sure opencl submenu and app images has been installed
>> +OPENCL_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-opencl"
Here is the RDEPENDS... ^^^^^
>> +
>> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
>> +
>> +PACKAGES = "matrix-opencl-demo-dsplibfft  \
>> +            matrix-opencl-demo-vecadd     \
>> +            matrix-opencl-demo-floatcompute \
>> +"
>> +
>> +RDEPENDS_matrix-opencl-demo-dsplibfft     = "${OPENCL_RDEPENDS}"
>> +RDEPENDS_matrix-opencl-demo-vecadd        = "${OPENCL_RDEPENDS}"
>> +RDEPENDS_matrix-opencl-demo-floatcompute  = "${OPENCL_RDEPENDS}"
>> +
>> +# Split the matrix files by opencl demos
>> +FILES_matrix-opencl-demo-dsplibfft     = "${MATRIX_APP_DIR}/opencl_dsplib_fft/*"
>> +FILES_matrix-opencl-demo-vecadd        = "${MATRIX_APP_DIR}/opencl_vecadd/*"
>> +FILES_matrix-opencl-demo-floatcompute  = "${MATRIX_APP_DIR}/opencl_float_compute/*"
>> +
>> +
>> +# Split the ${bindir} files by opencl demos
>> +FILES_matrix-opencl-demo-dsplibfft     += "${bindir}/runOclDsplibFFT.sh"
>> +FILES_matrix-opencl-demo-vecadd        += "${bindir}/runOclVecadd.sh"
>> +FILES_matrix-opencl-demo-floatcompute  += "${bindir}/runOclFloatCompute.sh"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


