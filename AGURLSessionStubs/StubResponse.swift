/*
* JBoss, Home of Professional Open Source.
* Copyright Red Hat, Inc., and individual contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation

public class StubResponse {
    
    let headers: Dictionary<String, String>
    let statusCode: Int
    let data: NSData
    let dataSize: Int
    let requestTime: NSTimeInterval  = 0.0
    let responseTime: NSTimeInterval = 0.0
	
		public init(data: NSData, statusCode: Int, headers: Dictionary<String, String>) {
			self.data = data
			self.statusCode = statusCode
			self.headers = headers
			self.dataSize = data.length
		}
	
		convenience public init(dataFromFile: NSString, statusCode: Int, headers: Dictionary<String, String>) {
			var data:NSData = NSData()
			if let path = NSBundle(forClass: StubResponse.self).pathForResource(dataFromFile.stringByDeletingPathExtension, ofType: dataFromFile.pathExtension) {
				data = NSData(contentsOfFile:path, options:NSDataReadingOptions.DataReadingMappedIfSafe, error: nil) ?? NSData()
			}
			self.init(data: data, statusCode: statusCode, headers: headers)
		}

}